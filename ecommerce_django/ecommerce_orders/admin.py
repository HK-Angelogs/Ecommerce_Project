from django.contrib import admin
from .models import Order, OrderItem

class OrderItemInline(admin.TabularInline):
    model = OrderItem
    raw_id_fields = ['product']

@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    # Added 'status' to list_display and list_editable for quick checks
    list_display = ['id', 'first_name', 'last_name', 'email', 'status', 'paid', 'created']
    list_filter = ['status', 'paid', 'created']
    list_editable = ['status'] 
    inlines = [OrderItemInline]