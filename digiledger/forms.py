from django.forms import ModelForm
from .models import Transaction, TransactionSource

class TransactionForm(ModelForm):
    class Meta:
        model = Transaction
        fields = '__all__'

class TransactionSourceForm(ModelForm):
    class Meta:
        model = TransactionSource
        fields = '__all__'
