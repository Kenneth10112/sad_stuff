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
    IntegratedSystem,
    Permission,
)
from django.views.decorators.csrf import csrf_exempt
from decimal import Decimal, InvalidOperation
from django.utils import timezone
from django.db import transaction
from django.http import HttpResponseBadRequest, HttpResponseServerError
import json
# Create your views here.

def access_control(request):
    current_user_id = request.session.get('current_user_id')
    current_user = DigiledgerUser.objects.get(id=current_user_id)

    context = {
        'CurrentUser': current_user,
        'Roles': EntityType.objects.all(),
        'Systems': IntegratedSystem.objects.all(),
        'entityDatas': getPermsSeperatedbyRole(),
    }
    getPermsSeperatedbyRole()

    return render(request, 'accCtrl/ac.html', context=context)

def getPermsSeperatedbyRole():
    permsByRole = {}

    for role in EntityType.objects.all():
        if role.entity_name == "Admin":
            continue
        _ = {}
        for system in IntegratedSystem.objects.all():
            _[system.sysName] = isEntityHasSystem(role, system)

        permsByRole[role.entity_name] = _

    print(json.dumps(permsByRole, indent=2))
    return permsByRole

def isEntityHasSystem(entity, system):
    try:
        Permission.objects.get(
            entity_type=entity, system=system
        )
    except Permission.DoesNotExist:
        return False
    else:
        return True