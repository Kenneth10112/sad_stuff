from django.shortcuts import render, redirect
from django.contrib import messages
from digiledger.models import (
    LoginCredential,
    DigiledgerUser,
    ContactInformation,
    EntityType,
    Section,
    RecordAccount,
    RecordStatementGroup,
    RecordType,
    Transaction,
    TransactionSource,
)
from django.views.decorators.csrf import csrf_exempt
from decimal import Decimal, InvalidOperation
from django.utils import timezone
from django.db import transaction
from django.http import HttpResponseBadRequest, HttpResponseServerError
import json

# Create your views here.
def dashboard(request):
    return render(request, 'ems/dashboard.html')