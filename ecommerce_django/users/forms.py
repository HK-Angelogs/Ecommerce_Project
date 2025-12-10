from django import forms
from django.contrib.auth.models import User
from .models import Profile

from django import forms
from django.contrib.auth.models import User
from .models import Profile

class UserUpdateForm(forms.ModelForm):
    email = forms.EmailField()

    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name', 'email']
        # Styling widgets to match Bootstrap form-control
        widgets = {
            'username': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter your username'}),
            'email': forms.EmailInput(attrs={'class': 'form-control', 'placeholder': 'name@example.com'}),
            'first_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter your first name'}),
            'last_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter your last name'}),
        }

# This is the class that was missing or named incorrectly
class ProfileUpdateForm(forms.ModelForm):
    class Meta:
        model = Profile
        fields = ['image', 'phone', 'address', 'city', 'state', 'zipcode', 'country']
        # Styling widgets to match Bootstrap form-control
        widgets = {
            'phone': forms.TextInput(attrs={'class': 'form-control', 'placeholder': '555-123-4567'}),
            'address': forms.TextInput(attrs={'class': 'form-control', 'placeholder': '123 Main St'}),
            'city': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'New York'}),
            'state': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'NY'}),
            'zipcode': forms.TextInput(attrs={'class': 'form-control', 'placeholder': '10001'}),
            'country': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'USA'}),
        }