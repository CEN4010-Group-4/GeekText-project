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
