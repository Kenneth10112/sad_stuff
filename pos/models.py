from django.db import models

# Create your models here.
class ItemGroup(models.Model):
    name = models.CharField(max_length=255, unique=True)

    def __str__(self):
        return self.name

class Item(models.Model):
    name = models.CharField(max_length=255)
    salePrice = models.DecimalField(max_digits=10, decimal_places=2)
    invPrice = models.DecimalField(max_digits=10, decimal_places=2)
    itemGroup = models.ForeignKey(ItemGroup, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.name} | {self.itemGroup}"