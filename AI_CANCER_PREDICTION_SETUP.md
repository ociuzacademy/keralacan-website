# CancerCare: Integrating the five research CNN models

## What was added

- A `prediction` Django app mounted at `/prediction/`.
- Five extracted HDF5 model files under `ml_models/`.
- Image upload validation (JPEG/PNG/WEBP, maximum 8 MB, dimension checks).
- Lazy model loading and per-model preprocessing (150x150 grayscale or RGB according to the saved model's input shape).
- Patient-scoped prediction history and a non-diagnostic result page.
- A link on the existing patient login-home page.
- A role marker added to the existing legacy login handlers so the prediction area requires the patient role.

## Important model findings

The supplied files are not all consistent with their notebooks:

- `brain_tumor.h5`: input `(150, 150, 1)`, 4 outputs. Labels copied from the notebook: pituitary, meningioma, glioma, notumor.
- `kidney_tumor.h5`: input `(150, 150, 1)`, 2 outputs. Notebook uses a sigmoid output with sparse categorical cross-entropy, which is an unusual configuration and needs a proper re-evaluation.
- `lung_cancer.h5`: input `(150, 150, 3)`, 3 outputs. The notebook architecture declares one channel, while its preprocessing code resizes to three channels; the saved model shape was used for preprocessing.
- `skin_cancer.h5`: input `(150, 150, 1)`, 2 outputs. The notebook resizes images to three channels, which conflicts with the saved model's input shape; preprocessing follows the saved model shape.
- `breast_cancer.h5`: input `(150, 150, 1)`, **3 output units**, while the notebook documents only two labels (`malignant`, `benign`). This model is intentionally blocked from prediction. Do not guess the third class or map the outputs without identifying the exact training labels and retraining/revalidating.

The labels above are based on notebook category lists. They are not independently verified from training artifacts. Models have not been independently clinically validated, and stored notebook accuracy is not a guarantee of real-world performance.

## Setup (Windows PowerShell)

1. Ensure Python, MySQL and the existing CancerCare dependencies are installed. Use a Python version supported by both the project's Django version and TensorFlow 2.20.
2. From the project root (the directory containing `manage.py`):

   ```powershell
   python -m venv .venv
   .\.venv\Scripts\Activate.ps1
   python -m pip install --upgrade pip
   python -m pip install -r requirements.txt
   python -m pip install -r requirements-ai.txt
   ```

   If your `requirements.txt` is saved as UTF-16, re-save it as UTF-8 before installing.
3. Configure the existing MySQL database in `cancercare/settings.py` and ensure `cancercare_db` exists.
4. Run:

   ```powershell
   python manage.py check
   python manage.py migrate
   python manage.py runserver
   ```
5. Sign in through the existing **patient login** route first. Then open `http://127.0.0.1:8000/prediction/` or use the link on the patient home page.

## Email configuration

Create a .env file and paste below code

EMAIL_BACKEND=django.core.mail.backends.smtp.EmailBackend
EMAIL_HOST=smtp.gmail.com
EMAIL_USE_TLS=True
EMAIL_PORT=587
EMAIL_HOST_USER=Your email 
EMAIL_HOST_PASSWORD=email app password

Test the configuration
python manage.py shell

from django.conf import settings
print(settings.EMAIL_HOST)
print(settings.EMAIL_PORT)
print(bool(settings.EMAIL_HOST_USER))
print(bool(settings.EMAIL_HOST_PASSWORD))


## Operational and privacy requirements

- Uploaded scans are saved below `private_prediction_uploads/`, outside the existing public `MEDIA_ROOT`. No public download URL is provided. Restrict filesystem and backup access to authorized operators.
- Patient authorization relies on the existing legacy session convention (`id` plus the new `role` flag). The existing application uses custom plaintext-password authentication and should be refactored to Django's authentication system before production use.
- TensorFlow is imported lazily. Pages unrelated to prediction can load without TensorFlow, but prediction requires the AI dependencies and compatible model loading.
- A Django migration is included. Test it against a copy of the existing database first.
- This is an educational/research prototype. Do not use its outputs to diagnose, rule out, or treat cancer. A qualified clinician must interpret medical images and results.
