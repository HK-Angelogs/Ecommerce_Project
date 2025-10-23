# Imports 
from django.contrib import admin
from .models import Categories
from .models import Products
from .models import Orders

# Register your models here.
admin.site.register(Categories)
admin.site.register(Products)
admin.site.register(Orders)
