from django.db import models
from .storage import PrivatePredictionStorage



class CancerPrediction(models.Model):
    """Prediction audit record linked to the existing patient table."""
    patient = models.ForeignKey("cancercareapp.patientreg_tb", on_delete=models.CASCADE, related_name="cancer_predictions")
    cancer_type = models.CharField(max_length=30)
    image = models.ImageField(storage=PrivatePredictionStorage(), upload_to="%Y/%m/")
    predicted_label = models.CharField(max_length=100)
    model_output = models.JSONField(default=list, blank=True)
    model_version = models.CharField(max_length=40, default="provided-h5")
    disclaimer_acknowledged = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True, db_index=True)

    class Meta:
        ordering = ["-created_at"]

    def __str__(self):
        return f"{self.cancer_type}: {self.predicted_label} ({self.patient_id})"
