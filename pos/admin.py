from django.contrib import admin

# Register your models here.
from .models import ItemGroup, Item
models_to_register = [
    ItemGroup,
    Item
]

for model in models_to_register:
    admin.site.register(model)
