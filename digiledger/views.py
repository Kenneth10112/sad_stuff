from django.shortcuts import render, redirect
from django.contrib import messages
from .models import FinancialTransactions
from django.views.decorators.csrf import csrf_exempt

def index(request):
    return render(request, 'digiledger/index.html')

@csrf_exempt
def accountant(request):
    return render(request, 'digiledger/accountant.html')

def supervisor(request):
    return render(request, 'digiledger/supervisor.html')

@csrf_exempt
def login(request):
    if request.method == "POST":
        uname = request.POST['username']
        upass = request.POST['password']

        if uname == "kenneth" and upass == "amboya":
            transactions = FinancialTransactions.objects.all()
            return render(request, "digiledger/accountant.html", {"transactions": transactions})
        else:
            return render(request, "digiledger/login.html", {"is_invalidLogin": True})

    else:
        return render(request, 'digiledger/login.html')