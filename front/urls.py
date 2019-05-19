from django.urls import path
from . import views as views_front

app_name = 'front'

urlpatterns = [
    path('',views_front.index),
    path('index/',views_front.index,name='index'),
    path('login/',views_front.login,name='login'),
    path('register/',views_front.register,name='register'),
    path('logout/',views_front.logout,name='logouot'),
    path('base/',views_front.base1,name='base'),
    path('applied/',views_front.applied,name='applied'),
    path('user/',views_front.user,name='user'),
    path('user/info/',views_front.info,name='info'),
    path('user/setpassword/',views_front.setpassword,name='setpassword')
]
