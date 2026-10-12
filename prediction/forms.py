from django import forms
from PIL import Image, UnidentifiedImageError


class PredictionUploadForm(forms.Form):
    cancer_type = forms.ChoiceField(choices=[
        ("brain", "Brain tumor (MRI)") ,
        ("breast", "Breast lesion (ultrasound)") ,
        ("kidney", "Kidney tumor image") ,
        ("lung", "Lung cancer image") ,
        ("skin", "Skin lesion image") ,
    ])
    image = forms.ImageField()
    disclaimer_acknowledged = forms.BooleanField(required=True, label="I understand this is an experimental AI result, not a medical diagnosis.")

    def clean_image(self):
        image = self.cleaned_data["image"]
        if image.size > 8 * 1024 * 1024:
            raise forms.ValidationError("Image must be 8 MB or smaller.")
        try:
            image.seek(0)
            with Image.open(image) as im:
                if im.format not in {"JPEG", "PNG", "WEBP"}:
                    raise forms.ValidationError("Upload a JPEG, PNG, or WEBP image.")
                if im.width < 32 or im.height < 32:
                    raise forms.ValidationError("Image dimensions must be at least 32 × 32 pixels.")
                if im.width > 8000 or im.height > 8000:
                    raise forms.ValidationError("Image dimensions must not exceed 8000 × 8000 pixels.")
                im.verify()
            image.seek(0)
        except (UnidentifiedImageError, OSError, ValueError):
            raise forms.ValidationError("The uploaded file is not a valid image.")
        return image
