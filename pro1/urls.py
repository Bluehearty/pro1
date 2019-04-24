"""pro1 URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from front import views as views_front

urlpatterns = [
    path('',views_front.index),
    path('index/',views_front.index,name='index'),
    path('admin/', admin.site.urls),
    path('login/',views_front.login,name='login'),
    path('register/',views_front.register,name='register'),
    path('logout/',views_front.logout,name='logouot'),
    path('base/',views_front.base1),
    path('applied/',views_front.applied),
    path('user/',views_front.user),
    path('user/info',views_front.info),
    path('user/setpassword',views_front.setpassword)

]
