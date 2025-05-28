from django.urls import path

from . import views

app_name = "ems"
urlpatterns = [
    path('', views.dashboard, name='dashboard'),
]
