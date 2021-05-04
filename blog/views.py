from django.shortcuts import render,redirect
from .models import Message


def message(request):
    name = request.POST['name']
    email = request.POST['email']
    content = request.POST['message']
    Message.objects.create(name=name, email=email, content=content)

    return redirect('index')

