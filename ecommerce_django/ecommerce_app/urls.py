from django.urls import path
from . import views 

urlpatterns = [
    path('', views.home_page, name='home_page'),
    path('cart/', views.cart_page, name='cart_page'),
    path('bestseller/', views.bestseller_page, name='bestseller_page'),
    path('checkout/', views.cheackout_page, name='cheackout_page'),
    path('shop/', views.shop_page, name='shop_page'),
    path('404/', views.error_page, name='404_page'),
    path('single/', views.single_page, name='single_page'),
    path('contact/', views.contact_page, name='contact_page'),
    path('Login.html', views.Login_page, name='Login_page'),
]