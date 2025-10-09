from django.shortcuts import render
from django.http import HttpResponse,JsonResponse

# Create your views here.
def ecommerce_call(request):
    return HttpResponse("HI MAAM TESTING LANG PO NG TEMPLATE AT FRAMEWORKS")

def ecommerce_page(request):
    ecommerce_title = "CPE 6"
    ecommerce_dictionary = {

        "ecommerce_title" : ecommerce_title,
        
    }
    return render(request, 'index.html', context=ecommerce_dictionary)