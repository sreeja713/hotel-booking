from django.db import models
from django.contrib.auth.models import User
from django.utils.translation import gettext as _
from django.db.models.signals import post_save
from django.dispatch import receiver
# Create your models here.

GENDER = (
    ('M', _('Male')),
    ('F', _('Female')),
)
class UserDetails(models.Model):
    uid = models.ForeignKey(User, on_delete=models.CASCADE)
    phone_number = models.CharField(max_length=15)
    place = models.CharField(max_length=30)
    gender = models.CharField(max_length=1, choices=GENDER)
    date_of_birth= models.DateField(blank=True,null=True)
    
    