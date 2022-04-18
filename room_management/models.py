from unicodedata import category
from django.utils import timezone
from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Category(models.Model):
    name=models.CharField(max_length=255)

    class Meta:
            permissions = [
                ('admin_permisions', 'Admin Permission'),
                ('user_prmission', 'User Permission'),
            ]
    def __str__(self):
        return self.name 

class subCategory(models.Model):
    name=models.CharField(max_length=255)
    capacit=models.IntegerField()
    

    class Meta:
            permissions = [
                ('admin_permisions', 'Admin Permission'),
                ('user_prmission', 'User Permission'),
            ]

    def __str__(self):
        return self.name 

class Rooms(models.Model):
    room_number=models.IntegerField()
    description=models.CharField(max_length=255)
    price=models.IntegerField()
    image=models.ImageField(upload_to="rooms/",null=True,blank=True)
    caregory=models.ForeignKey(Category, on_delete=models.CASCADE)
    subcategory=models.ForeignKey(subCategory, on_delete=models.CASCADE)
    occupaid=models.BooleanField()
    class Meta:
            permissions = [
                ('admin_permisions', 'Admin Permission'),
                ('user_prmission', 'User Permission'),
            ]
    def __str__(self):
        return self.room_number 

class Order(models.Model):
    user_id=models.ForeignKey(User, on_delete=models.CASCADE)
    order_date=models.DateTimeField(default=timezone.now)
    updated_date=models.DateTimeField(default=timezone.now)
    status=models.CharField(max_length=255)
    order_total=models.IntegerField()

class LineItem(models.Model):
    order_id=models.ForeignKey(Order, on_delete=models.CASCADE,related_name='lineitem')
    room_numb=models.ForeignKey(Rooms, on_delete=models.CASCADE)
    category=models.CharField(max_length=255)
    price=models.IntegerField()

class Booking(models.Model):
    order_id=models.ForeignKey(Order, on_delete=models.CASCADE)
    room_number=models.ForeignKey(Rooms, on_delete=models.CASCADE)
    user_id=models.ForeignKey(User, on_delete=models.CASCADE)
    price=models.IntegerField()
    starting_date=models.DateTimeField()
    ending_Date=models.DateTimeField()
    status=models.CharField(max_length=255)