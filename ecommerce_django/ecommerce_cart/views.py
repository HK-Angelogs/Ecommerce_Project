from django.shortcuts import render, redirect, get_object_or_404
from EcommerceProducts.models import Products
from .models import Cart, CartItem
from ecommerce_orders.models import OrderItem
from ecommerce_orders.forms import OrderCreateForm
from django.core.exceptions import ObjectDoesNotExist
from ecommerce_orders.models import Order 
from django.contrib.auth.decorators import login_required

# Private helper to get the cart session ID
def _cart_id(request):
    cart = request.session.session_key
    if not cart:
        cart = request.session.create()
    return cart

@login_required(login_url='Login_page')
def add_cart(request, product_id):
    current_product = get_object_or_404(Products, id=product_id)

    try:
        cart = Cart.objects.get(cart_id=_cart_id(request))
    except Cart.DoesNotExist:
        cart = Cart.objects.create(cart_id=_cart_id(request))
        cart.save()

    try:
        cart_item = CartItem.objects.get(product=current_product, cart=cart)
        cart_item.quantity += 1
        cart_item.save()
    except CartItem.DoesNotExist:
        CartItem.objects.create(
            product=current_product,
            quantity=1,
            cart=cart
        )

    return redirect('cart_summary')

def cart_summary(request, total_price=0, total_items=0, cart_items=None):
    try:
        cart = Cart.objects.get(cart_id=_cart_id(request))
        cart_items = CartItem.objects.filter(cart=cart, is_active=True)
        for item in cart_items:
            total_price += (item.product.price * item.quantity)
            total_items += item.quantity
    except ObjectDoesNotExist:
        pass 

    context = {
        'total_price': total_price,
        'total_items': total_items,
        'cart_items': cart_items,
    }
    return render(request, 'ecommerce_cart/cart_summary.html', context)

def cart_remove(request, product_id):
    cart = Cart.objects.get(cart_id=_cart_id(request))
    product = get_object_or_404(Products, id=product_id)
    cart_item = CartItem.objects.get(product=product, cart=cart)
    
    if cart_item.quantity > 1:
        cart_item.quantity -= 1
        cart_item.save()
    else:
        cart_item.delete()
    
    return redirect('cart_summary')

def cart_delete(request, product_id):
    cart = Cart.objects.get(cart_id=_cart_id(request))
    product = get_object_or_404(Products, id=product_id)
    cart_item = CartItem.objects.get(product=product, cart=cart)
    cart_item.delete()
    
    return redirect('cart_summary')

@login_required(login_url='Login_page')
def checkout(request, total_price=0, total_items=0, cart_items=None):
    try:
        cart = Cart.objects.get(cart_id=_cart_id(request))
        cart_items = CartItem.objects.filter(cart=cart, is_active=True)
        for item in cart_items:
            total_price += (item.product.price * item.quantity)
            total_items += item.quantity
    except ObjectDoesNotExist:
        pass 

    if request.method == 'POST':
        form = OrderCreateForm(request.POST)
        if form.is_valid():
            order = form.save()

            for item in cart_items:
                OrderItem.objects.create(
                    order=order,
                    product=item.product,
                    price=item.product.price,
                    quantity=item.quantity
                )

            cart_items.delete()

            return redirect('order_success', order_id=order.id)
    else:
        form = OrderCreateForm()

    context = {
        'total_price': total_price,
        'total_items': total_items,
        'cart_items': cart_items,
        'form': form,
    }
    return render(request, 'ecommerce_cart/checkout.html', context)

def order_success(request, order_id):
    order = get_object_or_404(Order, id=order_id)
    return render(request, 'ecommerce_cart/order_created.html', {'order': order})