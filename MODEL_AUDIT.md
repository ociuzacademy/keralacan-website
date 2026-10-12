# Supplied CNN model shape audit

The following metadata was read from the `model_config` attribute inside the supplied HDF5 files. It is a structural audit only; no TensorFlow inference or retraining was run in this environment.

| Integrated filename | Saved input shape | Saved output units | Integration status |
|---|---:|---:|---|
| `ml_models/brain_tumor.h5` | `(None, 150, 150, 1)` | 4 | Configured; load/inference still requires runtime test |
| `ml_models/breast_cancer.h5` | `(None, 150, 150, 1)` | 3 | **Blocked**: notebook documents only two labels |
| `ml_models/kidney_tumor.h5` | `(None, 150, 150, 1)` | 2 | Configured; sigmoid output with sparse categorical loss warrants re-evaluation |
| `ml_models/lung_cancer.h5` | `(None, 150, 150, 3)` | 3 | Configured using saved model input shape, not notebook's declared first-layer shape |
| `ml_models/skin_cancer.h5` | `(None, 150, 150, 1)` | 2 | Configured using saved model input shape; notebook resizes to three channels |

No model was treated as clinically validated. The saved model files were not executed because TensorFlow is not installed in the inspection environment.
