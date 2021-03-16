from django.shortcuts import render
from django.db.models import Q
from django.views.generic import TemplateView
from .models import Product
from .models import Author


# Create your views here.
class SearchView(TemplateView):
    template_name = "search.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        kw = self.request.GET.get("q")
        results = Product.objects.filter(Q(name__icontains=kw) | Q(genre__name__icontains=kw) | Q(author__first_name__icontains=kw) | Q(author__last_name__icontains=kw))
        
        context["results"] = results
        return context

def book_details(request, id = None):
    if id:
        item = Product.objects.get(id=id)
        
    
    
    context = {      
        'id': item.id, 
        'name': item.name,
        'cover': item.image,
        'author': item.author, 
        'bio': item.author.biography,   
        'description': item.description,
        'genre': item.genre,
        'publisher': item.publisher,
        'release_date': item.release_date
    }
    
    return render(request,'bookstore/book_details.html', context)


def all_books(request, id=None):
    if id:
        item = Product.objects.get(id=id)
    else:
        item = Product.objects.get(id=1)
    
    
    context = {
        'items': Product.objects.all().order_by('id'),
        
        'id': item.id, 
        'name': item.name,
        'cover': item.image,
        'author': item.author,
    }
    
    return render(request,'bookstore/all_books.html', context)


def book_author(request, id=None):
    item = Product.objects.get(id=id)
    
    context = {
        'items': Product.objects.all(),
        'authors': Author.objects.all(),
        'id': item.id, 
        'name': item.name,
        'cover': item.image,
        'author': item.author,
    }
    
    return render(request,'bookstore/book_author_with_pk.html', context)

def books(request):
    return render(request,'bookstore/books.html')
