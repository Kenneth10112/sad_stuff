from django.shortcuts import render, redirect
from django.contrib import messages
from django.db.models import Sum
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
    current_user_id = request.session.get('current_user_id')
    current_user = DigiledgerUser.objects.get(id=current_user_id)
    context = {
        'currentUser': current_user,
    }

    context["grandTotal"] = grand_total_expenses = Transaction.objects.filter(
        destination__record_type__name="Expenses"
    ).aggregate(
        total_expense_value=Sum('mon_val')
    )['total_expense_value']

    context["individualTotals"] = individual_account_expenses = Transaction.objects.filter(
        destination__record_type__name="Expenses"
    ).values(
        'destination__account_name' # Group by the name of the destination account
    ).annotate(
        account_total=Sum('mon_val') # Calculate the sum for each account
    ).order_by('destination__account_name')


    return render(request, 'ems/dashboard.html', context=context)
