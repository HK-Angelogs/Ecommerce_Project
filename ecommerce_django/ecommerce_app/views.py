from django.shortcuts import render
from django.http import HttpResponse,JsonResponse

# Create your views here.
def home_page (request):
    return render(request, 'index.html', {} )

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
    return render(request, 'Login.html', {})