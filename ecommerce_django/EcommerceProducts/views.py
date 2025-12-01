from django.shortcuts import render, get_object_or_404
from django.contrib.auth.decorators import login_required
from .models import Products, BrowsingHistory

# 1. Single Product View (Records History)
def product_view(request, pk):
    product = get_object_or_404(Products, id=pk)

    # --- HISTORY RECORDING LOGIC ---
    if request.user.is_authenticated:
        # Update timestamp if exists, or create new record
        BrowsingHistory.objects.update_or_create(
            user=request.user,
            product=product,
            defaults={'product': product} 
        )
    # -------------------------------

    return render(request, 'single.html', {'product': product})

# 2. User History View (Displays History)
@login_required
def history_view(request):
    # Get last 12 viewed unique products
    history = BrowsingHistory.objects.filter(user=request.user).select_related('product')[:12]
    return render(request, 'history.html', {'history': history})