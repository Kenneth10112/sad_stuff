from django.urls import path

from . import views

app_name = "login"
urlpatterns = [
    path('', views.login, name='login'),
    path('reroute/', views.reroute, name='reroute'),
    path('logout/', views.logout_view, name='logout'),
]
