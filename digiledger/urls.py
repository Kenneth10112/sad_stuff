from django.urls import path

from . import views

app_name = "digiledger"
urlpatterns = [
    path('', views.index, name='index'),
    path('accountant/', views.accountant, name='accountant'),
    path('supervisor/', views.supervisor, name='supervisor'),
    path('login/', views.login, name='login'),
]
