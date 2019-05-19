from django.db import models

# Create your models here.
class User(models.Model):
    '''用户表'''

    mobile = models.CharField(max_length=11,unique=True) #0
    password = models.CharField(max_length=16)
    name = models.CharField(max_length=10)      #1
    area = models.CharField(max_length=30)      #2
    address = models.CharField(max_length=30)    #3
    QQ = models.CharField(max_length=11)         #4
    WX = models.CharField(max_length=20)         #5
    email = models.EmailField(unique=True)        #6
    tb = models.CharField(max_length=15,unique=True)   #7
    c_time = models.DateTimeField(auto_now_add=True)   #8

    class Meta:
        ordering = ['c_time']
        verbose_name = '用户'
        verbose_name_plural = '用户'

    def __str__(self):
        return "<mobile:%s name:%s>"%(self.mobile,self.name)


