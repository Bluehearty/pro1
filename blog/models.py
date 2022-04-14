from django.db import models
from django.contrib.auth.models import User
from mdeditor.fields import MDTextField


class Message(models.Model):
    name = models.CharField(max_length=50)
    email = models.EmailField(unique=False)
    content = models.TextField()
    c_time = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return "<name: %s>" % self.name

    class Meta:
        ordering = ['-c_time']


class BlogType(models.Model):
    type_name = models.CharField(max_length=15)

    def __str__(self):
        return self.type_name


class Blog(models.Model):
    title = models.CharField(max_length=50)
    blog_type = models.ForeignKey('BlogType',on_delete=models.DO_NOTHING)
    #content = RichTextUploadingField()
    # content = models.TextField()
    content = MDTextField('content')
    author = models.ForeignKey(User,on_delete=models.DO_NOTHING)
    read_num = models.IntegerField(default=0)
    c_time = models.DateTimeField(auto_now_add=True)
    up_time = models.DateTimeField()
    cover = models.CharField(max_length=150)

    def __str__(self):
        return "<title: %s>"%self.title

    class Meta:
        ordering = ['-c_time']
