from django.contrib import admin
from .models import User
from .models import Customer


# Register your models here.
admin.site.register(User)
admin.site.register(Customer)