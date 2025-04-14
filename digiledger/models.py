from django.db import models

# Create your models here.
class LoginCredentials(models.Model):
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

class DigiledgerUsers(models.Model):
    login_credentials = models.OneToOneField(LoginCredentials, on_delete=models.CASCADE, unique=True)
    contact_information = models.OneToOneField(ContactInformation, on_delete=models.CASCADE, unique=True)
    entity_type = models.ForeignKey(EntityType, on_delete=models.CASCADE)
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name

class Permissions(models.Model):
    entity_type = models.ForeignKey(EntityType, on_delete=models.CASCADE)
    perm_name = models.CharField(max_length=255)

    def __str__(self):
        return self.perm_name

class FinancialTransactions(models.Model):
    reference_id = models.CharField(max_length=255)
    monetary_value = models.DecimalField(max_digits=10, decimal_places=2)
    transaction_type = models.CharField(max_length=100)
    date_created = models.DateTimeField(auto_now_add=True)
    encoded_by_user = models.ForeignKey(DigiledgerUsers, on_delete=models.CASCADE)
    is_checked = models.BooleanField(default=False)

    def __str__(self):
        return f"Transaction: {self.transaction_type} - {self.monetary_value}"

class RecordTypes(models.Model):
    type_name = models.CharField(max_length=255, unique=True)
    config = models.TextField()
    is_manager_only = models.BooleanField(default=False)

    def __str__(self):
        return self.type_name

class FinancialRecords(models.Model):
    record_id = models.CharField(max_length=255, unique=True)
    value = models.DecimalField(max_digits=10, decimal_places=2)
    record_type = models.ForeignKey(RecordTypes, on_delete=models.CASCADE) # Added null=True, blank=True
    date_created = models.DateTimeField(auto_now_add=True)
    generated_by_user = models.ForeignKey(DigiledgerUsers, on_delete=models.CASCADE) # Added null=True, blank=True

    def __str__(self):
        return self.record_id


class StatementToRecordRelationships(models.Model):
    statement_record = models.ForeignKey(FinancialRecords, on_delete=models.CASCADE, related_name='statement_records')
    related_record = models.ForeignKey(FinancialRecords, on_delete=models.CASCADE, related_name='related_records')

    class Meta:
        unique_together = ('statement_record', 'related_record')

    def __str__(self):
        return f"Statement: {self.statement_record} - Related: {self.related_record}"


class RecordToTransactionRelationships(models.Model):
    record = models.ForeignKey(FinancialRecords, on_delete=models.CASCADE)
    related_transaction = models.ForeignKey(FinancialTransactions, on_delete=models.CASCADE)

    class Meta:
        unique_together = ('record', 'related_transaction')

    def __str__(self):
        return f"Record: {self.record} - Transaction: {self.related_transaction}"