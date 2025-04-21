from django.urls import path

from . import views

app_name = "digiledger"
urlpatterns = [
    path('', views.login, name='login'),
    path('dashboard/', views.dashboard, name='dashboard'),
    path('new_entry/', views.new_entry, name="new_entry"),
    path('accountant/', views.accountant, name='accountant'),
    path('supervisor/', views.supervisor, name='supervisor'),
]
