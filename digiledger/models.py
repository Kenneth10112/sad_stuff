from django.db import models

# Create your models here.
class LoginCredential(models.Model):
    username = models.CharField(max_length=255, unique=True)
    password = models.CharField(max_length=255)

    def __str__(self):
        return self.username

class ContactInformation(models.Model):
    email = models.CharField(max_length=255, unique=True)
    phone_number = models.CharField(max_length=20, unique=True)

    def __str__(self):
        return f"{self.email},{self.phone_number}"


class EntityType(models.Model):
    entity_name = models.CharField(max_length=255, unique=True)

    def __str__(self):
        return self.entity_name

class DigiledgerUser(models.Model):
    login_credentials = models.OneToOneField(LoginCredential, on_delete=models.CASCADE, unique=True)
    contact_information = models.OneToOneField(ContactInformation, on_delete=models.CASCADE, unique=True)
    entity_type = models.ForeignKey(EntityType, on_delete=models.CASCADE)
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name

class Permission(models.Model):
    entity_type = models.ForeignKey(EntityType, on_delete=models.CASCADE)
    perm_name = models.CharField(max_length=255)

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
    ENTRY_TYPE_CHOICES = [
        ('Debit', 'Debit'),
        ('Credit', 'Credit'),
    ]

    reference_id = models.CharField(max_length=255, unique=True)
    monetary_value = models.DecimalField(max_digits=10, decimal_places=2)
    entry_type = models.CharField(
        max_length=50,
        choices=ENTRY_TYPE_CHOICES
    )
    date_of_entry = models.DateTimeField()
    record_account = models.ForeignKey(RecordAccount, on_delete=models.CASCADE)
    section = models.ForeignKey(Section, on_delete=models.CASCADE)
    entry_by = models.ForeignKey(DigiledgerUser, on_delete=models.SET_NULL, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Txn {self.reference_id} ({self.entry_type}) - {self.monetary_value} on {self.date_of_entry.strftime('%Y-%m-%d')}"
