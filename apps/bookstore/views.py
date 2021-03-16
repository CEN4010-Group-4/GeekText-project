from django.shortcuts import render
from django.db.models import Q
from django.views.generic import TemplateView, ListView
from .models import Product
from .models import Author
from .models import Genre
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger



class SearchView(ListView):
    template_name = "search.html"
    context_object_name = "products"
    def get_queryset(self):
        queryset_list = Product.objects.all()
        kw = self.request.GET.get("q")
        if Q:
            queryset_list = queryset_list.filter(Q(name__icontains=kw) | Q(genre__name__icontains=kw) | Q(author__first_name__icontains=kw) | Q(author__last_name__icontains=kw))
        paginator = Paginator(queryset_list, 10)
        page = self.request.GET.get('page')
        try:
            queryset_list = paginator.page(page)
        except PageNotAnInteger:
            queryset_list = paginator.page(1)
        except EmptyPage:
            queryset_list = paginator.page(paginator.num_pages)
        return queryset_list

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
