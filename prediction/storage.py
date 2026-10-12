from django.conf import settings
from django.core.files.storage import FileSystemStorage
from django.utils.deconstruct import deconstructible


@deconstructible
class PrivatePredictionStorage(FileSystemStorage):
    """Store medical uploads outside the publicly served MEDIA_ROOT."""
    def __init__(self, location=None, base_url=None, file_permissions_mode=None, directory_permissions_mode=None):
        private_root = location or (settings.BASE_DIR / "private_prediction_uploads")
        super().__init__(
            location=str(private_root),
            base_url=base_url,
            file_permissions_mode=file_permissions_mode,
            directory_permissions_mode=directory_permissions_mode,
        )
