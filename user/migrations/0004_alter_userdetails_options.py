# Generated by Django 4.0.3 on 2022-04-11 10:18

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0003_alter_userdetails_date_of_birth'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='userdetails',
            options={'permissions': [('admin_permisions', 'Admin Permission'), ('user_permisions', 'User Permission')]},
        ),
    ]
