"""Inference wrappers for the provided Keras HDF5 models.

Models are loaded lazily. This module intentionally does not import TensorFlow at
Django startup so normal site pages can load when the optional AI dependency is
not installed.
"""
from functools import lru_cache
from pathlib import Path

import numpy as np
from PIL import Image, ImageOps
from django.conf import settings


MODEL_CONFIG = {
    "brain": {
        "file": "brain_tumor.h5", "channels": 1,
        "labels": ["pituitary", "meningioma", "glioma", "no tumor"],
        "input_size": (150, 150),
    },
    "breast": {
        "file": "breast_cancer.h5", "channels": 1,
        "labels": ["malignant", "benign"], "input_size": (150, 150),
        "blocked_reason": "The supplied breast H5 file has 3 output units, but the notebook defines only 2 labels. Its class mapping cannot be verified, so predictions are disabled until this model is reconciled and re-evaluated.",
    },
    "kidney": {
        "file": "kidney_tumor.h5", "channels": 1,
        "labels": ["normal", "tumor"], "input_size": (150, 150),
    },
    "lung": {
        "file": "lung_cancer.h5", "channels": 3,
        "labels": ["adenocarcinoma", "benign", "squamous carcinoma"],
        "input_size": (150, 150),
    },
    "skin": {
        "file": "skin_cancer.h5", "channels": 1,
        "labels": ["benign", "malignant"], "input_size": (150, 150),
    },
}


@lru_cache(maxsize=5)
def _load_model(cancer_type):
    try:
        from tensorflow.keras.models import load_model
    except ImportError as exc:
        raise RuntimeError("TensorFlow is not installed. Install requirements-ai.txt to enable predictions.") from exc
    config = MODEL_CONFIG[cancer_type]
    path = Path(settings.BASE_DIR) / "ml_models" / config["file"]
    if not path.is_file():
        raise RuntimeError(f"Model file is missing: {path}")
    try:
        model = load_model(path, compile=False)
    except Exception as exc:
        raise RuntimeError(f"Could not load the {cancer_type} model with the installed TensorFlow/Keras version: {exc}") from exc

    input_shape = tuple(model.input_shape[1:])
    expected_shape = (150, 150, config["channels"])
    if input_shape != expected_shape:
        raise RuntimeError(f"{cancer_type} model input shape is {input_shape}, expected {expected_shape}. Review the model/preprocessing before use.")
    output_shape = tuple(model.output_shape[1:])
    if len(output_shape) != 1 or output_shape[0] != len(config["labels"]):
        raise RuntimeError(
            f"{cancer_type} model has output shape {output_shape}, but {len(config['labels'])} labels are defined. "
            "Prediction is blocked to prevent incorrect class names."
        )
    return model


def predict_image(cancer_type, uploaded_file):
    """Return a mapped class and raw scores; never claims to diagnose disease."""
    if cancer_type not in MODEL_CONFIG:
        raise ValueError("Unsupported cancer type.")
    config = MODEL_CONFIG[cancer_type]
    if config.get("blocked_reason"):
        raise RuntimeError(config["blocked_reason"])

    model = _load_model(cancer_type)
    uploaded_file.seek(0)
    mode = "L" if config["channels"] == 1 else "RGB"
    with Image.open(uploaded_file) as image:
        image = ImageOps.exif_transpose(image).convert(mode)
        image = image.resize(config["input_size"], Image.Resampling.BILINEAR)
        array = np.asarray(image, dtype=np.float32) / 255.0
    if config["channels"] == 1:
        array = np.expand_dims(array, axis=-1)
    batch = np.expand_dims(array, axis=0)
    raw = np.asarray(model.predict(batch, verbose=0)).reshape(-1)
    if len(raw) != len(config["labels"]):
        raise RuntimeError("Model output count does not match its configured class labels; prediction was not saved.")
    idx = int(np.argmax(raw))
    return {
        "label": config["labels"][idx],
        "scores": [round(float(v), 6) for v in raw],
        "labels": config["labels"],
        "score_note": "Scores are raw model outputs, not calibrated probabilities or diagnostic certainty.",
    }
