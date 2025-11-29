from django.shortcuts import render
from django.http import HttpResponse,JsonResponse
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.shortcuts import redirect
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from django import forms
from.forms import SignUpForm


# Create your views here.
def home_page (request):
    return render(request, 'index.html', {} )

def Base_file (request):
    return render(request, 'Base.html', {} )

def Nav_page(request):
    return render(request, 'Nav.html', {} )

def cart_page(request):
    return render(request, 'cart.html', {} )

def bestseller_page(request):
    return render(request, 'bestseller.html', {} )

def cheackout_page(request):
    return render(request, 'cheackout.html', {})

def contact_page(request):
    return render(request, 'contact.html', {})

def error_page(request):
    return render(request, '404.html', {})

def shop_page(request):
    return render(request, 'shop.html', {})

def single_page(request):
    return render(request, 'single.html', {})

def Login_page(request):
    if request.user.is_authenticated:
        return redirect('home_page')  # prevents loop
    
    if request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            messages.success(request, "Login successful.")
            return redirect('home_page')
        else:
            messages.error(request, "Invalid username or password.")
            return redirect('Login_page')

    return render(request, 'Login.html', {})

def Logout_page(request):   
    logout(request)
    messages.success(request, "You have been logged out.")
    return redirect('home_page')

def register_user(request):
    form = SignUpForm()
    if request.method == "POST":
        form = SignUpForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password1')
            # Login
            user = authenticate(username=username, password=password)   
            login(request, user)

            messages.success(request, "Registration successful. You can now log in.")
            return redirect('Login_page')
        else:
            messages.error(request, "Unsuccessful registration. Invalid information.")
            return render(request, 'Registration.html', {'form': form})
        
    return render(request, 'Registration.html', {'form': form})