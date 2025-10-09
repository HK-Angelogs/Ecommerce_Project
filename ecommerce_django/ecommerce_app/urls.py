from django.urls import path
from . import views 

urlpatterns = [
    path('',views.ecommerce_call,name="index"),
    path('ecommerce_page',views.ecommerce_page,name="ecommerce_page")
]
