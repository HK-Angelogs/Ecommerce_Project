from django.db import models
from users.models import Customer
import datetime

# Create your models here.

# Categories
class Categories(models.Model):
    name = models.CharField(max_length=50)

    def __str__(self):
        return self.name

#All of Our Products
class Products(models.Model):
    name = models.CharField(max_length=50)
    price = models.DecimalField(default=0, decimal_places=2, max_digits=10)
    category = models.ForeignKey(Categories, on_delete=models.CASCADE, default =1)
    description = models.CharField(max_length=250,default='', blank = True, null = True)
    image = models.ImageField(upload_to='uploads/product/')

    def __str__(self):
        return self.name

class Orders(models.Model):
    product = models.ForeignKey(Products, on_delete=models.CASCADE )
    customer = models.ForeignKey(Customer,on_delete=models.CASCADE)
    quantity = models.IntegerField(default=1)
    address = models.CharField(max_length=100, default='', blank = True, null = True)
    phone = models.CharField(max_length= 20, default='', blank= True)
    date = models.DateField(default=datetime.datetime.today)
    status = models.BooleanField(default=False)

    def __str__(self):
        return self.name
