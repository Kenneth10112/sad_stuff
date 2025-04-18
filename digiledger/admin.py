from django.contrib import admin

# Register your models here.
from .models import LoginCredential, ContactInformation, EntityType, DigiledgerUser, Permission

models_to_register = [
    LoginCredential,
    ContactInformation,
    EntityType,
    DigiledgerUser,
    Permission,
]

for model in models_to_register:
    admin.site.register(model)
