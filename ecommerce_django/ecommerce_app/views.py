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
from django.db.models import Q



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
    products = Products.objects.all()
    categories = Categories.objects.filter(parent=None).prefetch_related('children')
    current_category_id = None

    # --- 1. SEARCH LOGIC ---
    search_query = request.GET.get('q')
    if search_query:
        products = products.filter(
            Q(name__icontains=search_query) | 
            Q(description__icontains=search_query)
        )

    # --- 2. CATEGORY LOGIC ---
    if category_id:
        category = get_object_or_404(Categories, id=category_id)
        current_category_id = category.id
        
        # Get list of this category ID AND all its subcategory IDs
        # This ensures if you click "Electronics", you also see "Laptops"
        cat_ids = list(category.children.values_list('id', flat=True))
        cat_ids.append(category.id)
        
        products = products.filter(category__id__in=cat_ids)

    context = {
        'products': products,
        'categories': categories,
        'search_query': search_query,
        'current_category_id': current_category_id, # Used for highlighting active tab in sidebar
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

def product_view(request, pk):
    # 1. Fetch the specific product clicked
    product = get_object_or_404(Products, pk=pk)
    
    # 2. Fetch Related Products (same category, excluding the current one)
    related_products = Products.objects.filter(category=product.category).exclude(pk=pk)[:4]
    
    context = {
        'product': product,
        'related_products': related_products,
    }
    return render(request, 'single.html', context)