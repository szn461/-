# Generated by Django 2.2.2 on 2024-06-28 20:42

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('management', '0006_position_salary'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='book',
            name='price',
        ),
    ]
