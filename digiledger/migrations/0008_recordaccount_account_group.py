# Generated by Django 5.2 on 2025-05-11 13:51

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('digiledger', '0007_recordaccountgroup'),
    ]

    operations = [
        migrations.AddField(
            model_name='recordaccount',
            name='account_group',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='digiledger.recordaccountgroup'),
            preserve_default=False,
        ),
    ]
