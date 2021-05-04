from django.db import models


class Message(models.Model):
    name = models.CharField(max_length=50)
    email = models.EmailField(unique=False)
    content = models.TextField()
    c_time = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return "<name: %s>" % self.name

    class Meta:
        ordering = ['-c_time']