# Generated by Django 5.2 on 2025-04-19 03:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('digiledger', '0003_remove_transaction_side'),
    ]

    operations = [
        migrations.AddField(
            model_name='transaction',
            name='dsc',
            field=models.CharField(default='Transaction', max_length=255),
            preserve_default=False,
        ),
    ]
