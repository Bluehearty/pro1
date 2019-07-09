from django.db import models
from django.contrib.auth.models import User
from django.utils.html import format_html
from ckeditor_uploader.fields import RichTextUploadingField

class BlogType(models.Model):
    type_name = models.CharField(max_length=15)

    def __str__(self):
        return self.type_name

class Blog(models.Model):
    title = models.CharField(max_length=50)
    blog_type = models.ForeignKey('BlogType',on_delete=models.DO_NOTHING)
    #content = RichTextUploadingField()
    content = models.TextField()
    author = models.ForeignKey(User,on_delete=models.DO_NOTHING)
    read_num = models.IntegerField(default=0)
    c_time = models.DateTimeField(auto_now_add=True)
    up_time = models.DateTimeField()

    def __str__(self):
        return "<title: %s>"%self.title

    class Meta:
        ordering = ['-c_time']

class ImageUpload(models.Model):
    name = models.CharField(max_length=15)
    image = models.ImageField(upload_to='article/%Y%m%d/', blank=True)
    c_time = models.DateTimeField(auto_now_add=True)

    def image_data(self):
        return format_html(
            '<img src="{}" width="100px"/>',
            self.image.url,
        )

    image_data.short_description = u'图片'

    def __str__(self):
        return self.name