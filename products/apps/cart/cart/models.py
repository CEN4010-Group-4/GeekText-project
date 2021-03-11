from django.db import models
from apps.bookstore.models import Product
# Create your models here.

class Cart(models.Model):
    total = models.DecimalField(max_digits=65, decimal_places=2,default=0.00)
    timestamp = models.DateTimeField(auto_now_add=True, auto_now=False)
    updated = models.DateTimeField(auto_now_add=False,auto_now=True)
    active = models.BooleanField(default=True)

    def __unicode__(self):
        return "Cart id: %s" %(self.id)


