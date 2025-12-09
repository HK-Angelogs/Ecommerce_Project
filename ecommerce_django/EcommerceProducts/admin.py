from django.contrib import admin
from .models import Categories, Products

# Define a custom admin layout for Categories
class CategoryAdmin(admin.ModelAdmin):
    list_display = ('name', 'parent')
    search_fields = ('name',)
    list_filter = ('parent',)

# Define a custom admin layout for Products
class ProductAdmin(admin.ModelAdmin):
    list_display = ('name', 'price', 'category')
    list_filter = ('category',)

# Register your models
admin.site.register(Categories, CategoryAdmin)
admin.site.register(Products, ProductAdmin)