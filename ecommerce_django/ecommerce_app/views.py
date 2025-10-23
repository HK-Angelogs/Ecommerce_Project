from django.shortcuts import render
from django.http import HttpResponse,JsonResponse

# Create your views here.
def landing_page(request):
    return render(request, 'landing_page.html', {} )

