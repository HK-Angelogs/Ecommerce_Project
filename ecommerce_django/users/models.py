from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save

# Create your models here.

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    image = models.ImageField(default='default.jpg', upload_to='profile_pics')
    
    # Billing Details
    address = models.CharField(max_length=200, blank=True)
    city = models.CharField(max_length=100, blank=True)
    state = models.CharField(max_length=100, blank=True)
    zipcode = models.CharField(max_length=20, blank=True)
    country = models.CharField(max_length=100, blank=True)
    phone = models.CharField(max_length=20, blank=True)

    def __str__(self):
        return f'{self.user.username} Profile'

class User (models.Model):
    email = models.EmailField(max_length=30)
    password = models.CharField(max_length=30)

    def __str__(self):
        return f'{self.email}{self.password}'
    

class Customer (models.Model):
    first_name = models.CharField(max_length=70) 
    last_name = models.CharField(max_length=70)
    phone = models.CharField(max_length=10)

    def __str__(self):
        return f'{self.first_name}{self.last_name}'     