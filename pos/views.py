from django.shortcuts import render
from django.http import HttpResponse
from .models import (
    ItemGroup,
    Item
)


def index(request):
    context = {
        'Items': Item.objects.all(),
        'ItemGroups': ItemGroup.objects.all()
    }
    return render(request, 'pos/pos.html', context=context)
