from EcommerceProducts.models import Categories

def global_categories(request):
    return {
        'categories': Categories.objects.filter(parent=None).prefetch_related('children')
    }