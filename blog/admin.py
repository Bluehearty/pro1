from django.contrib import admin
from .models import Message

# Register your models here.


@admin.register(Message)
class BlogAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'email', 'content', 'c_time')

