from django.shortcuts import render

# Create your views here.

def cq_index(request):

    return render(request, 'chongqing/index.html')

