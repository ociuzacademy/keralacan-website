from django.contrib import messages
from django.core.paginator import Paginator
from django.shortcuts import redirect, render
from django.views.decorators.http import require_http_methods

from cancercareapp.models import patientreg_tb
from .forms import PredictionUploadForm
from .models import CancerPrediction
from .services.inference import MODEL_CONFIG, predict_image
from .services.inference import MODEL_CONFIG, predict_image


def _current_patient(request):
    # Legacy CancerCare login uses a shared session key, so require the role flag
    # added to the patient login flow rather than trusting an ID alone.
    if request.session.get("role") != "patient":
        return None
    patient_id = request.session.get("id")
    if not patient_id:
        return None
    return patientreg_tb.objects.filter(pk=patient_id).first()


def prediction_home(request):
    patient = _current_patient(request)
    if patient is None:
        messages.error(request, "Please sign in with a patient account to use the prediction area.")
        return redirect("/")
    return render(request, "prediction/home.html", {"models": MODEL_CONFIG})


@require_http_methods(["GET", "POST"])
def predict(request):
    patient = _current_patient(request)
    if patient is None:
        messages.error(request, "Please sign in with a patient account to use the prediction area.")
        return redirect("/")

    if request.method == "POST":
        form = PredictionUploadForm(request.POST, request.FILES)
        if form.is_valid():
            cancer_type = form.cleaned_data["cancer_type"]
            image = form.cleaned_data["image"]
            try:
                result = predict_image(cancer_type, image)
            except (RuntimeError, ValueError) as exc:
                form.add_error(None, str(exc))
            else:
                record = CancerPrediction(
                    patient=patient,
                    cancer_type=cancer_type,
                    predicted_label=result["label"],
                    model_output=result["scores"],
                    disclaimer_acknowledged=form.cleaned_data["disclaimer_acknowledged"],
                )
                record.image.save(image.name, image, save=False)
                record.save()
                score_rows = list(zip(result["labels"], result["scores"]))
                return render(request, "prediction/result.html", {"record": record, "result": result, "score_rows": score_rows})
    else:
        form = PredictionUploadForm()
    return render(request, "prediction/upload.html", {"form": form, "models": MODEL_CONFIG})


def history(request):
    patient = _current_patient(request)
    if patient is None:
        messages.error(request, "Please sign in with a patient account to view prediction history.")
        return redirect("/")
    records = CancerPrediction.objects.filter(patient_id=patient.pk)
    page = Paginator(records, 20).get_page(request.GET.get("page"))
    return render(request, "prediction/history.html", {"page": page, "models": MODEL_CONFIG})


