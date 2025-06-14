# Generated by Django 5.2 on 2025-05-26 13:56

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('login', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Item',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('salePrice', models.DecimalField(decimal_places=2, max_digits=10)),
                ('invPrice', models.DecimalField(decimal_places=2, max_digits=10)),
                ('itemGroup', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='login.itemgroup')),
            ],
        ),
    ]
