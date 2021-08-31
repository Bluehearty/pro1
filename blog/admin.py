from django.contrib import admin
from .models import Message, BlogType, Blog

# Register your models here.


@admin.register(Message)
class BlogAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'email', 'content', 'c_time')


@admin.register(BlogType)
class BlogTypeAdmin(admin.ModelAdmin):
    list_display = ('id', 'type_name')


@admin.register(Blog)
class BlogAdmin(admin.ModelAdmin):
    list_display = ('title', 'blog_type', 'author', 'c_time', 'up_time', 'cover')
