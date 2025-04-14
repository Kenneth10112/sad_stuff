from django.shortcuts import render, redirect
from django.contrib import messages

def index(request):
    return render(request, 'digiledger/index.html')

def accountant(request):
    return render(request, 'digiledger/accountant.html')

def supervisor(request):
    return render(request, 'digiledger/supervisor.html')

def login(request):
    if request.method == "POST":
        uname = request.POST['username']
        upass = request.POST['password']

        if uname == "kenneth" and upass == "amboya":
            return redirect("digiledger:accountant")
        else:
            return render(request, "digiledger/login.html", {"is_invalidLogin": True})

    else:
        return render(request, 'digiledger/login.html')