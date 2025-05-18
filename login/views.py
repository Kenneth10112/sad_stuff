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
    Permission,
)
from django.views.decorators.csrf import csrf_exempt
from decimal import Decimal, InvalidOperation
from django.utils import timezone
from django.db import transaction
from django.http import HttpResponseBadRequest, HttpResponseServerError
import json

# Create your views here.
@csrf_exempt
def login(request):
    if request.method == "POST":
        uname = request.POST['username']
        upass = request.POST['password']

        try:
            user = DigiledgerUser.objects.get(
                login_credentials=LoginCredential.objects.get(username=uname, password=upass)
            )
            request.session['current_user_id'] = user.id
            
        except LoginCredential.DoesNotExist:
            print(f"Test Login Failed for username: {uname}")
            error_message = "Invalid test username or password."
            return render(request, 'login/login.html', {'is_invalidLogin': True})

        else:

            current_user_id = request.session.get('current_user_id')
            current_user = DigiledgerUser.objects.get(id=current_user_id)
            print(json.dumps(get_availablePermissionsOfUser(current_user), indent=4))
            return redirect('login:reroute')
    else:

        return render(request, 'login/login.html')

def reroute(request):  
    current_user_id = request.session.get('current_user_id')
    current_user = DigiledgerUser.objects.get(id=current_user_id)

    context = {
        'CurrentUser': current_user,
        'Perms': get_availablePermissionsOfUser(current_user)
    }

    return render(request, 'login/reroutePage.html', context=context)

def get_availablePermissionsOfUser(user: DigiledgerUser):
    permissions = Permission.objects.filter(
        entity_type=user.entity_type
    )

    perms = []
    for permission in permissions:
        _ = {}
        _["sysName"] = permission.system.sysName
        _["url_link"] = permission.system.url_link
        perms.append(_)

    return perms
