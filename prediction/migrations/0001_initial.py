# Generated for the CancerCare prediction integration.
from django.db import migrations, models
import django.db.models.deletion
import prediction.storage


class Migration(migrations.Migration):
    initial = True
    dependencies = [("cancercareapp", "0001_initial")]
    operations = [
        migrations.CreateModel(
            name="CancerPrediction",
            fields=[
                ("id", models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name="ID")),
                ("patient", models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name="cancer_predictions", to="cancercareapp.patientreg_tb")),
                ("cancer_type", models.CharField(max_length=30)),
                ("image", models.ImageField(storage=prediction.storage.PrivatePredictionStorage(), upload_to="%Y/%m/")),
                ("predicted_label", models.CharField(max_length=100)),
                ("model_output", models.JSONField(blank=True, default=list)),
                ("model_version", models.CharField(default="provided-h5", max_length=40)),
                ("disclaimer_acknowledged", models.BooleanField(default=False)),
                ("created_at", models.DateTimeField(auto_now_add=True, db_index=True)),
            ],
            options={"ordering": ["-created_at"]},
        ),
    ]
