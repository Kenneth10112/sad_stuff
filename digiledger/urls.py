from django.urls import path

from . import views

app_name = "digiledger"
urlpatterns = [
    path('', views.login, name='login'),
    path('dashboard/', views.dashboard, name='dashboard'),
    path('sign_up/', views.signUp, name="signUp"),
    path('new_entry/', views.new_entry, name="new_entry"),
    path('new_entry/entNewAcc', views.entNewAcc, name="entNewAcc"),
    path('new_entry/entNewSec', views.entNewSec, name="entNewSec"),

]
