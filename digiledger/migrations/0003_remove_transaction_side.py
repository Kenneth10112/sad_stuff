# Generated by Django 5.2 on 2025-04-19 02:28

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('digiledger', '0002_rename_entry_by_transaction_ent_by_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='transaction',
            name='side',
        ),
    ]
