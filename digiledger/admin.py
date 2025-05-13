from django.contrib import admin

# Register your models here.
from .models import LoginCredential, ContactInformation, EntityType, DigiledgerUser, Permission
from .models import Section, RecordAccount, Transaction, TransactionSource, RecordType, RecordStatementGroup

models_to_register = [
    LoginCredential,
    ContactInformation,
    EntityType,
    DigiledgerUser,
    Permission,
    Section,
    RecordAccount,
    Transaction,
    TransactionSource,
    RecordType,
    RecordStatementGroup,
]

for model in models_to_register:
    admin.site.register(model)
