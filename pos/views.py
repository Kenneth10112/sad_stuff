from django.shortcuts import render
from django.http import HttpResponse

def index(request):
    return httpresponse("this is the index")
