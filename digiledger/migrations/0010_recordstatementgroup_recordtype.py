# Generated by Django 5.2 on 2025-05-13 10:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('digiledger', '0009_remove_recordaccount_account_group_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='RecordStatementGroup',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255, unique=True)),
            ],
        ),
        migrations.CreateModel(
            name='RecordType',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255, unique=True)),
            ],
        ),
    ]
