from django.urls import path
from . import views

app_name = "prediction"
urlpatterns = [
    path("", views.prediction_home, name="home"),
    path("upload/", views.predict, name="upload"),
    path("history/", views.history, name="history"),
]
