from django.db import models

# Create your models here.

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


