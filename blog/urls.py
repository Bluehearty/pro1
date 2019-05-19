from django.urls import path
from . import views

urlpatterns = [
    path('',views.blog_list,name='blog_list'),
    path('detail/<int:blog_pk>',views.blog_detail,name='blog_detail'),
    path('category/<int:category_pk>',views.blog_category,name='blog_category'),
    path('data/<int:year>/<int:month>',views.blog_date,name='blog_date')
]