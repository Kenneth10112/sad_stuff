from django.shortcuts import render, redirect
from django.contrib import messages
from .models import (
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


def dashboard(request):  
    current_user_id = request.session.get('current_user_id')
    current_user = DigiledgerUser.objects.get(id=current_user_id)

    context = {
        'CurrentUser': current_user,
        'Sections': Section.objects.all(),
        'GroupedDestination_txn': group_transactions_by_destination(),
        'tTblData': get_tTableData_new(),
        'BalSheetData': get_balanceSheetData(),
        'IncomeStatement': get_incomeStatementData(),
    }

    return render(request, 'digiledger/Dashboard.html', context=context)

def new_entry(request):
    if request.method == 'POST':
        ref_id = request.POST.get('ref_id', '').strip()
        mon_val_str = request.POST.get('mon_val')
        section_name = request.POST.get('section')
        destination_account_name = request.POST.get('destination')
        description = request.POST.get('dsc_textarea', '').strip()

                # --- Access Multi-Value Source Fields ---
        source_mon_vals_str = request.POST.getlist('src_mon_val[]')
        source_account_names = request.POST.getlist('src_account[]')

                # --- Basic Validation & Type Conversion ---
        if not all([ref_id, mon_val_str, section_name, destination_account_name, source_mon_vals_str, source_account_names]):
            # Handle missing required fields (return an error response or message)
            return HttpResponseBadRequest("Missing required form fields.")

        if len(source_mon_vals_str) != len(source_account_names):
            return HttpResponseBadRequest("Mismatch between number of source values and source accounts.")

        try:
            # Convert monetary values to Decimal
            total_mon_val = Decimal(mon_val_str)
            source_mon_vals = [Decimal(val) for val in source_mon_vals_str]

            # Validate that the sum of source values equals the total monetary value
            if sum(source_mon_vals) != total_mon_val:
                return HttpResponseBadRequest("Sum of source monetary values does not match the total entry monetary value.")

        except InvalidOperation:
            return HttpResponseBadRequest("Invalid monetary value format. Please enter numbers.")

        # --- Database Operations (within an atomic transaction) ---
        try:
            with transaction.atomic(): # Ensures all operations succeed or fail together
                # 1. Fetch related objects (Section, Destination Account)
                # Assumes they exist. Use get_or_create or try-except for more robustness.
                section_obj = Section.objects.get(section_name=section_name)
                destination_account_obj = RecordAccount.objects.get(account_name=destination_account_name)

                current_user_id = request.session.get('current_user_id')
                current_user = DigiledgerUser.objects.get(id=current_user_id)

                # 2. Create the main Transaction instance
                new_transaction = Transaction.objects.create(
                    ref_id=ref_id,
                    mon_val=total_mon_val,
                    ent_date=timezone.now(), # Use current time
                    dsc=description,
                    destination=destination_account_obj,
                    section=section_obj,
                    ent_by=current_user # Assign the logged-in user
                )

                # 3. Create the related TransactionSource instances
                for i in range(len(source_mon_vals)):
                    src_val = source_mon_vals[i]
                    src_acc_name = source_account_names[i]

                    # Fetch the source RecordAccount object
                    source_account_obj = RecordAccount.objects.get(account_name=src_acc_name)

                    TransactionSource.objects.create(
                        mon_val=src_val,
                        transaction=new_transaction,  # Link to the newly created transaction
                        source_account=source_account_obj
                    )

            # --- Success ---
            # Redirect to a success page or display a success message
            # messages.success(request, f"Transaction {ref_id} created successfully!")

        except Section.DoesNotExist:
            return HttpResponseBadRequest(f"Error: Section '{section_name}' not found.")
        except RecordAccount.DoesNotExist as e:
            # Identify if it was the destination or a source account
            # This requires a bit more logic, but a simple message can work initially:
            return HttpResponseBadRequest(f"Error: A specified Record Account was not found.")
        except Exception as e:
            # Catch other potential errors during database operations
            # Log the error e
            print(f"An unexpected error occurred: {e}") # For debugging
            return HttpResponseServerError("An unexpected error occurred while saving the transaction.")
        else:
            current_user_id = request.session.get('current_user_id')
            current_user = DigiledgerUser.objects.get(id=current_user_id)

            context = {
                'CurrentUser': current_user,
                'Sections': Section.objects.all(), 
                'Accounts': RecordAccount.objects.all(),
                'Transactions': get_transactions(),
            }

            return redirect('digiledger:dashboard') # Replace with your actual success URL

    else:
        current_user_id = request.session.get('current_user_id')
        current_user = DigiledgerUser.objects.get(id=current_user_id)

        context = {
            'CurrentUser': current_user,
            'Sections': Section.objects.all(), 
            'Accounts': RecordAccount.objects.all(),
            'Transactions': get_transactions(),
        }


        return render(request, 'digiledger/entNew.html', context=context)

def entNewAcc(request):
    if request.method == "POST":
        acc_name = request.POST['acc_name']
        entNewAccount = RecordAccount.objects.create(account_name=acc_name)
        return render(request, 'digiledger/entNewAcc.html', {"post_success": True})

    else:
        return render(request, 'digiledger/entNewAcc.html')

def entNewSec(request):
    if request.method == "POST":
        sec_name = request.POST['sec_name']
        entNewAccount = RecordAccount.objects.create(account_name=sec_name)
        return render(request, 'digiledger/entNewSec.html', {"post_success": True}) # Replace with your actual success URL
    else:
        return render(request, 'digiledger/entNewSec.html')

def signUp(request):
    if request.method == "POST":
        user_Name = request.POST.get("user_Name")
        ent_Type = request.POST.get("ent_Type")
        username = request.POST.get("username").strip()
        password = request.POST.get("password").strip()
        email = request.POST.get("email").strip()
        phoneNumber = request.POST.get("phoneNumber").strip()

        if not all([user_Name, ent_Type, username, password, email, phoneNumber]):
            # Handle missing required fields (return an error response or message)
            return HttpResponseBadRequest("Missing required form fields.")

        try:
            with transaction.atomic(): # Ensures all operations succeed or fail together
                entity_obj = EntityType.objects.get(entity_name=ent_Type)

                newUser = DigiledgerUser.objects.create(
                    name=user_Name,
                    entity_type=entity_obj,
                    login_credentials=LoginCredential.objects.create(
                        username=username,
                        password=password
                    ),
                    contact_information=ContactInformation.objects.create(
                        email=email,
                        phone_number=phoneNumber
                    )
                    
                )
        except Section.DoesNotExist:
            return HttpResponseBadRequest(f"Error: Section '{section_name}' not found.")
        else:
            return render(request, 'digiledger/newUser.html', {'EntityType': EntityType.objects.all()})
    else:
        return render(request, 'digiledger/newUser.html', {'EntityType': EntityType.objects.all()})

# =======================
# ======functions========
# =======================
# Main Data getters functions
def get_transactions():
    transaction_list = [

    ]
    for transaction in Transaction.objects.all():
        attributes = {
            'ref_id': transaction.ref_id,
            'ent_date': transaction.ent_date,
            'destination': transaction.destination,
            'debit_mon_val': transaction.mon_val,
            'desc': transaction.dsc,
            'sources': [],
        }
        for source in transaction.sources.all():
            source_info = {
                'source_account': source.source_account,
                'credit_mon_val': source.mon_val,
            }
            attributes['sources'].append(source_info)
        transaction_list.append(attributes)

    return transaction_list

def group_transactions_by_destination():
    acc_groups = []
    accounts = RecordAccount.objects.all()
    for account in accounts:
        acc_group = {}

        # acc_name and total mon val
        acc_group["account_name"] = account.account_name
        total_monVal = 0
        for transaction in Transaction.objects.filter(destination=account):
            total_monVal += int(transaction.mon_val)
        acc_group["totalMonVal"] = total_monVal

        # get transac here 
        txns_w_src = []
        for transaction in Transaction.objects.filter(destination=account):
            attribute = {}
            attribute["ref_id"] = transaction.ref_id
            attribute["mon_val"] = transaction.mon_val
            attribute["ent_date"] = transaction.ent_date
            attribute["dsc"] = transaction.dsc
            attribute["destination"] = transaction.destination
            attribute["section"] = transaction.section
            attribute["ent_by"] = transaction.ent_by
            srcs = []
            for source in transaction.sources.all():
                src = {}
                src["src_account"] = source.source_account
                src["mon_val"] = source.mon_val
                srcs.append(src)
            attribute["sources"] = srcs
            txns_w_src.append(attribute)
        acc_group["txns_w_src"] = txns_w_src
        # append to acc_groups
        acc_groups.append(acc_group)
    return acc_groups

def get_tTableData_new():
    acc_groups = []
    accounts = RecordAccount.objects.all()

    for account in accounts:
        acc_group_attr = {}
        acc_group_attr["account_name"] = account.account_name

        acc_group_attr["records"], acc_group_attr["end_balance"] = get_endBal_and_add_currentBal_to_txnTxnSrcDictKey(
            accountGetAll_txnTxnSrc_sortByDate(
                RecordAccount.objects.get(account_name=account)
            )
        )

        if acc_group_attr["end_balance"] >= 0:
            acc_group_attr["side"] = "debit"
        else:
            acc_group_attr["side"] = "credit"

        acc_groups.append(acc_group_attr)
    return acc_groups

def get_balanceSheetData():
    statementGroups = {}

    statementGroups["assets"] = get_acc_group_by_RecType(
        RecordType.objects.get(
            name="Assets"
        )
    )
    statementGroups["liabilities"] = get_acc_group_by_RecType(
        RecordType.objects.get(
            name="Liabilities"
        )
    )
    statementGroups["equity"] = get_acc_group_by_RecType(
        RecordType.objects.get(
            name="Equity"
        )
    )
    statementGroups["revenue"] = get_acc_group_by_RecType(
        RecordType.objects.get(
            name="Revenue"
        )
    )
    statementGroups["expenses"] = get_acc_group_by_RecType(
        RecordType.objects.get(
            name="Expenses"
        )
    )

    return statementGroups

def get_incomeStatementData():
    statementGroups = {}

    statementGroups["revenue"] = get_acc_group_by_RecType(
        RecordType.objects.get(
            name="Revenue"
        )
    )
    for account in statementGroups["revenue"]["accounts"]:
        account["end_balance"] *= -1
    statementGroups["revenue"]["RevenueTotalMonVal"] *= -1


    statementGroups["expenses"] = get_acc_group_by_RecType(
        RecordType.objects.get(
            name="Expenses"
        )
    )
    for account in statementGroups["expenses"]["accounts"]:
        account["end_balance"] *= -1
    statementGroups["expenses"]["ExpensesTotalMonVal"] *= -1

    return statementGroups

# Misc functions
def accountGetAll_txnTxnSrc_sortByDate(account):
    records = []


    for transaction in Transaction.objects.filter(destination=account):
        record = {}
        record["date"] = transaction.ent_date
        record["mon_val"] = transaction.mon_val
        record["side"] ="debit"
        record["rel_acc"] = transaction.sources.first().source_account
        record["reference"] = transaction.ref_id
        records.append(record)

    for source in TransactionSource.objects.filter(source_account=account):
        record = {}
        record["date"] = source.transaction.ent_date
        record["mon_val"] = source.mon_val
        record["side"] = "credit"
        record["rel_acc"] = source.transaction.destination
        record["reference"] = source.transaction.ref_id
        records.append(record)

    sorted_records = sorted(records, key=lambda item: item['date'])
    return sorted_records

def get_endBal_and_add_currentBal_to_txnTxnSrcDictKey(sorted_records):
    current_bal = 0
    for record in sorted_records:
        if record["side"] == "debit":
            current_bal += record["mon_val"]
            record["current_bal"] = current_bal
        else:
            current_bal -= record["mon_val"]
            record["current_bal"] = current_bal
    
    _ = (
        sorted_records,
        current_bal
    )
    return _

def getAccountEndBalAndSide(acc_name):
    allTxnTxnSrc_sortedByDate = accountGetAll_txnTxnSrc_sortByDate(acc_name)

    balance = 0
    balanceSide = "debit"

    for txnTxnSrc in allTxnTxnSrc_sortedByDate:
        if txnTxnSrc["side"] == "debit":
            balance += txnTxnSrc["mon_val"]
        else:
            balance -= txnTxnSrc["mon_val"]
    
    if balance >= 0:
            balanceSide = "debit"
    else:
            balanceSide = "credit"

    return (balance, balanceSide)

def get_acc_group_by_RecType(recType: RecordType):
    xAccount = RecordAccount.objects.filter(
        record_type=recType
    )
    xGroup = {}
    accList = []
    accountBal = 0
    for accountElement in xAccount:
        account = {}
        account["account_name"] = accountElement.account_name
        account["end_balance"], account["side"] = getAccountEndBalAndSide(
            accountElement
        )
        if account["side"] == "debit":
            accountBal += int(account["end_balance"])
        else:
            accountBal += int(account["end_balance"])
        accList.append(account)
    print(f"BAL: {accountBal}")
    xGroup["accounts"] = accList
    xGroup[f"{recType.name}TotalMonVal"] = accountBal

    return xGroup