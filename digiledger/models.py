from django.db import models

# Create your models here.
class LoginCredential(models.Model):
    username = models.CharField(max_length=255, unique=True)
    password = models.CharField(max_length=255)

    def __str__(self):
        return self.username  # Or any other field that uniquely identifies a credential

class ContactInformation(models.Model):
    email = models.CharField(max_length=255, unique=True)
    phone_number = models.CharField(max_length=20, unique=True)

    def __str__(self):
        return self.email # Or phone_number




class EntityType(models.Model):
    entity_name = models.CharField(max_length=255, unique=True)

    def __str__(self):
        return self.entity_name

class DigiledgerUser(models.Model):
    name = models.CharField(max_length=255)
    entity_type = models.ForeignKey(EntityType, on_delete=models.CASCADE)
    login_credentials = models.OneToOneField(LoginCredential, on_delete=models.CASCADE, unique=True)
    contact_information = models.OneToOneField(ContactInformation, on_delete=models.CASCADE, unique=True)

    def __str__(self):
        return self.name #  Or a combination of fields

class Permission(models.Model):
    perm_name = models.CharField(max_length=255)
    entity_type = models.ForeignKey(EntityType, on_delete=models.CASCADE)

    def __str__(self):
        return self.perm_name

class Section(models.Model):
    section_name = models.CharField(max_length=255, unique=True)

    def __str__(self):
        return self.section_name

class RecordAccount(models.Model):
    account_name = models.CharField(max_length=255, unique=True)

    def __str__(self):
        return self.account_name

class Transaction(models.Model):
    ref_id = models.CharField(max_length=255, unique=True)
    mon_val = models.DecimalField(max_digits=10, decimal_places=2)
    ent_date = models.DateTimeField()
    dsc = models.CharField(max_length=255)
    destination = models.ForeignKey(RecordAccount, related_name='destination_transactions', on_delete=models.CASCADE)
    section = models.ForeignKey(Section, on_delete=models.CASCADE)
    ent_by = models.ForeignKey(DigiledgerUser, on_delete=models.SET_NULL, null=True, blank=True)

    def __str__(self):
        return f"Txn {self.ref_id} - {self.mon_val} on {self.ent_date.strftime('%Y-%m-%d %H:%M:%S')}" #Added time

class TransactionSource(models.Model):
    mon_val = models.DecimalField(max_digits=10, decimal_places=2)
    transaction = models.ForeignKey(Transaction, related_name='sources', on_delete=models.CASCADE)
    source_account = models.ForeignKey(RecordAccount, on_delete=models.CASCADE)

    class Meta:
        unique_together = ('transaction', 'source_account')  # Prevent duplicate sources per transaction

    def __str__(self):
        return f"{self.transaction.ref_id} - Source: {self.source_account}"
