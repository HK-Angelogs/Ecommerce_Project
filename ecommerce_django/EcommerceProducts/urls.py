from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    # ... your other urls ...
    path('product/<int:pk>/', views.product_view, name='product_view'),
    path('history/', views.history_view, name='history'),
]