from django.shortcuts import render

from .models import Product
from .models import Author


def book_details(request):
    obj = Product.objects.get(id=1)
    if Product.objects.get(id=1):
        author_info = Author.objects.get(id=3)
    context = {      
        'id': obj.id, 
        'name': obj.name,
        'cover': obj.image,
        'author': obj.author, 
        'bio': author_info.biography,   
        'description': obj.description,
        'genre': obj.genre,
        'publisher': obj.publisher,
        'release_date': obj.release_date
    }
    
        
    #context = {
    #    'object': obj
    #}
    return render(request,'bookstore/book_details.html', context)

def all_books(request):
    obj = Product.objects.get(id=1)

    context = {
        'items': Product.objects.all(),
        'object': obj,
        'id': obj.id, 
        'name': obj.name,
        'cover': obj.image,
        'author': obj.author,
       
    }
    
    return render(request,'bookstore/all_books.html', context)


def books(request):
    return render(request,'bookstore/books.html')


# Create your views here.
