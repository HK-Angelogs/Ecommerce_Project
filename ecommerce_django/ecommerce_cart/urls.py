from django.urls import path
from . import views

urlpatterns = [
    path('', views.cart_summary, name='cart_summary'),
    path('add/<int:product_id>/', views.add_cart, name='add_cart'),
    path('remove/<int:product_id>/', views.cart_remove, name='cart_remove'),
    path('delete/<int:product_id>/', views.cart_delete, name='cart_delete'),
    path('checkout/', views.checkout, name='checkout'),
    path('success/<int:order_id>/', views.order_success, name='order_success'),
]   