from django import forms
from .models import Order

class OrderCreateForm(forms.ModelForm):
    class Meta:
        model = Order
        fields = ['first_name', 'last_name', 'company_name', 'email', 'phone', 
                  'address', 'city', 'country', 'postal_code', 'order_notes', 'payment_method']