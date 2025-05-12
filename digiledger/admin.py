from django.contrib import admin

# Register your models here.
from .models import LoginCredential, ContactInformation, EntityType, DigiledgerUser, Permission
from .models import Section, RecordAccount, Transaction, TransactionSource, RecordAccountGroup

models_to_register = [
    LoginCredential,
    ContactInformation,
    EntityType,
    DigiledgerUser,
    Permission,
    Section,
    RecordAccount,
    RecordAccountGroup,
    Transaction,
    TransactionSource,
]

for model in models_to_register:
    admin.site.register(model)
