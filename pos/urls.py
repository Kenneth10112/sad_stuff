from django.urls import path

from . import views

app_name = "pos"
urlpatterns = [
    path('', views.index, name='index'),
    path('addTxn', views.addTransact, name='addTransact'),
    
]
