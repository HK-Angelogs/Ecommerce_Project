from django.shortcuts import render
from django.http import HttpResponse,JsonResponse
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.shortcuts import redirect
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from django import forms
from.forms import SignUpForm
from EcommerceProducts.models import Products
from django.shortcuts import render, redirect, get_object_or_404 # Added get_object_or_404
from EcommerceProducts.models import Products, Categories # Added Categories
# ... keep your other existing imports ...


# Create your views here.
from EcommerceProducts.models import Products, Categories # Ensure Categories is imported

def home_page(request):
    products = Products.objects.all()
    
    # --- ADD THIS ---
    # Fetch Parent categories (those with no parents) for the menu
    categories = Categories.objects.filter(parent=None).prefetch_related('children')
    # ----------------
    
    context = {
        'products': products,
        'categories': categories, # Pass it to the template
    }
    return render(request, 'index.html', context)

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

def shop_page(request, category_id=None):
    # 1. Get only top-level categories (parents) for the sidebar
    categories = Categories.objects.filter(parent=None).prefetch_related('children')
    
    # 2. Determine which products to show
    if category_id:
        # Get the specific category
        category = get_object_or_404(Categories, id=category_id)
        
        # Get products belonging to this category OR its subcategories
        # We grab the IDs of the category itself + all its children
        sub_ids = category.children.values_list('id', flat=True)
        products = Products.objects.filter(category__id__in=list(sub_ids) + [category.id])
    else:
        # No category selected? Show everything
        products = Products.objects.all()

    context = {
        'products': products,
        'categories': categories,
        'current_category_id': category_id,
    }
    return render(request, 'shop.html', context)

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