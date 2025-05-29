from django.urls import path

from . import views

app_name = "acs_ctrl"
urlpatterns = [
    path('', views.access_control, name='access_control'),
    path('createNewEnt/', views.createNewEntity, name='createNewEntity'),
    path('deleteEntity/', views.deleteEntity, name='deleteEntity')
]
