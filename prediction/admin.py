from django.contrib import admin
from .models import CancerPrediction


@admin.register(CancerPrediction)
class CancerPredictionAdmin(admin.ModelAdmin):
    list_display = ("id", "patient", "cancer_type", "predicted_label", "created_at")
    list_filter = ("cancer_type", "created_at")
    search_fields = ("patient__name", "patient__email", "predicted_label")
    readonly_fields = ("created_at", "model_output")
