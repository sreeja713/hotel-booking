# Generated by Django 4.0.3 on 2022-04-11 09:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0002_alter_userdetails_date_of_birth'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userdetails',
            name='date_of_birth',
            field=models.DateField(blank=True, null=True),
        ),
    ]
