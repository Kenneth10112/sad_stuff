# Generated by Django 5.2 on 2025-05-30 11:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('digiledger', '0016_permission_system'),
    ]

    operations = [
        migrations.CreateModel(
            name='LatestRefId',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('posRefId', models.CharField(max_length=255, unique=True)),
                ('emsRefId', models.CharField(max_length=255, unique=True)),
            ],
        ),
    ]
