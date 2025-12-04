from django.shortcuts import render, get_object_or_404
from django.contrib.auth.decorators import login_required
#  Added Categories to imports so we can fetch them for the sidebar
from .models import Products, BrowsingHistory, Categories 

# 1. Single Product View
def product_view(request, pk):
    # Fetch the current product
    product = get_object_or_404(Products, id=pk)

    # --- RELATED PRODUCTS LOGIC ---
    # 1. Filter products by the same category as the current product
    # 2. Exclude the current product (so it doesn't show up in the list)
    # 3. Order by '?' to randomize the selection every time the page loads
    # 4. Slice [:6] to limit results (good for carousel performance)
    related_products = Products.objects.filter(
        category=product.category
    ).exclude(
        id=product.id
    ).order_by('?')[:6]

    # --- SIDEBAR CATEGORIES LOGIC ---
    # Your single.html has a sidebar looping through 'categories'.
    # We fetch only parent categories (parent=None) to keep the list clean.
    categories = Categories.objects.filter(parent=None)

    # --- HISTORY RECORDING LOGIC ---
    if request.user.is_authenticated:
        BrowsingHistory.objects.update_or_create(
            user=request.user,
            product=product,
            defaults={'product': product} 
        )
    
    # Context dictionary to pass data to the template
    context = {
        'product': product,
        'related_products': related_products, #  Used in template loop
        'categories': categories,             #  Used in sidebar loop
    }

    return render(request, 'single.html', context)


# 2. User History View
@login_required
def history_view(request):
    # Get last 12 viewed unique products
    history = BrowsingHistory.objects.filter(user=request.user).select_related('product')[:12]
    return render(request, 'history.html', {'history': history})