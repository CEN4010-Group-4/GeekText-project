from django.db import models
from django.utils import timezone
from django.urls import  reverse
from apps.users.models import *
# Create your models here.

class Genre(models.Model): # model to create table on database genre
    name = models.CharField(max_length=200,db_index=True)
    slug = models.SlugField(max_length=200,unique=True)
    
    class Meta:
        ordering = ('name',)
        verbose_name = 'genre'
        verbose_name_plural = 'genres'

    def __str__(self):
        return self.name
    
    def get_absolute_url(self):
        return reverse('category_detail',args=[self.slug])


class Product(models.Model): # model to create table on database products
    genre = models.ForeignKey('Genre',related_name='products',on_delete=models.CASCADE)
    author = models.ForeignKey('Author',related_name='authors',on_delete=models.CASCADE)
    name = models.CharField(max_length=200, db_index=True)
    slug = models.SlugField(max_length=200, db_index=True)
    image = models.ImageField(upload_to='static/media',blank=True)
    image2 = models.ImageField(upload_to='media/%Y/%m/%d',blank=True)
    image3 = models.ImageField(upload_to='media/%Y/%m/%d',blank=True)
    publisher = models.CharField(max_length=100, db_index=True)
    release_date = models.DateTimeField(null=True)
    description = models.TextField(blank=True)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    created = models.DateTimeField(default=timezone.now)
    updated = models.DateTimeField(auto_now=True)
    
    
    class Meta:
        ordering = ('-created',)
        index_together = (('id', 'slug'),)
    
    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('product_detail',args=[str(self.slug)])


class Author(models.Model): # model to create table on database author
    first_name = models.CharField(max_length=200, db_index=True)
    last_name = models.CharField(max_length=200, db_index=True)
    biography = models.TextField(blank=True)
    created = models.DateTimeField(auto_now=True)
    
    class Meta:
        ordering = ('-first_name',)
        index_together = (('id'),)
    
    def __str__(self):
        return self.first_name + " " + self.last_name


class Cart(models.Model):
    customer = models.ForeignKey(Customer, on_delete=models.SET_NULL, null = True, blank=True)
    total = total = models.DecimalField(default=0.00, max_digits=10, decimal_places=2)
    created_at = models.DateTimeField(default=timezone.now, blank=True, null=True)

    def __str__(self):
        return "Cart: " + str(self.id)
    
class CartProduct(models.Model):
    cart = models.ForeignKey(Cart, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    rate = models.PositiveIntegerField()
    quantity = models.PositiveIntegerField()
    subtotal = models.PositiveIntegerField()

    def __str__(self):
        return "Cart: " + str(self.cart.id) + " CartProduct: " + str(self.id)

