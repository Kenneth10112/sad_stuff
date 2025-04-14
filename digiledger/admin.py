from django.contrib import admin

# Register your models here.
from .models import LoginCredentials, ContactInformation, EntityType, DigiledgerUsers
from .models import Permissions, FinancialTransactions, RecordTypes, FinancialRecords
from .models import StatementToRecordRelationships, RecordToTransactionRelationships

models_to_register = [
    LoginCredentials,
    ContactInformation,
    EntityType,
    DigiledgerUsers,
    Permissions,
    FinancialTransactions,
    RecordTypes,
    FinancialRecords,
    StatementToRecordRelationships,
    RecordToTransactionRelationships,
]

for model in models_to_register:
    admin.site.register(model)
