# Generated by Django 4.0.3 on 2022-04-11 14:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('room_management', '0002_alter_category_options'),
    ]

    operations = [
        migrations.CreateModel(
            name='subCategory',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('capacit', models.IntegerField()),
            ],
            options={
                'permissions': [('admin_permisions', 'Admin Permission'), ('user_prmission', 'User Permission')],
            },
        ),
    ]