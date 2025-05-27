from django.urls import path

from . import views

app_name = "accCtrl"
urlpatterns = [
    path('', views.access_control, name='access_control')

]
