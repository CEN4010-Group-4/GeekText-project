from django.shortcuts import render, redirect
from django.db.models import Q
from django.views.generic import TemplateView, ListView, View
from .models import Product
from .models import Author
from .models import Genre
from .models import CartProduct
from .models import Cart
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

def book_details(request, id=None):
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
    author_list = Product.objects.select_related('author').get(id=id)
    
    context = {
        'items': Product.objects.all(),
        'book_list': Product.objects.filter(author_id = id),
        'id': item.id, 
        'name': item.name,
        'cover': item.image,
        'author': item.author,
        'author_id': item.author_id,
    }

    return render(request,'bookstore/book_author.html', context)
def books(request):
    
    return render(request,'bookstore/books.html')

class AddToCartView(TemplateView):
    template_name = "addtocart.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        product_id = self.kwargs['pro_id']
        product_obj = Product.objects.get(id=product_id)
        
        cart_id = self.request.session.get("cart_id", None)
        if cart_id:
            cart_obj = Cart.objects.get(id=cart_id)
            this_product_in_cart = cart_obj.cartproduct_set.filter(product=product_obj)
            if this_product_in_cart.exists():
                cartproduct = this_product_in_cart.last()
                cartproduct.quantity += 1
                cartproduct.subtotal += product_obj.price
                cartproduct.save()
                cart_obj.total += product_obj.price
                cart_obj.save()
            else:
                cartproduct = CartProduct.objects.create(cart=cart_obj, product=product_obj, rate=product_obj.price, quantity=1, subtotal=product_obj.price)
                cart_obj.total += product_obj.price
                cart_obj.save()
        else:
            cart_obj = Cart.objects.create(total = 0)
            self.request.session['cart_id'] = cart_obj.id
            cartproduct = CartProduct.objects.create(cart=cart_obj, product=product_obj, rate=product_obj.price, quantity=1, subtotal=product_obj.price)
            cart_obj.total += product_obj.price
            cart_obj.save()
        return context





class ChangeCartView(View):
    def get(self, request, *args, **kwargs):
        
        cp_id = self.kwargs["cp_id"]
        action = request.GET.get("action")
        cp_obj = CartProduct.objects.get(id=cp_id)
        cart_obj = cp_obj.cart

        if action == "inc":
            cp_obj.quantity += 1
            cp_obj.subtotal += cp_obj.rate
            cp_obj.save()
            cart_obj.total += cp_obj.rate
            cart_obj.save()
        elif action == "dcr":
            cp_obj.quantity -= 1
            cp_obj.subtotal -= cp_obj.rate
            cp_obj.save()
            cart_obj.total -= cp_obj.rate
            cart_obj.save()
            if cp_obj.quantity == 0:
                cp_obj.delete()

        elif action == "rmv":
            cart_obj.total -= cp_obj.subtotal
            cart_obj.save()
            cp_obj.delete()
        else:
            pass
        return redirect("cart")



class cart(TemplateView):
    template_name = "cart.html"

    def get_context_data(self,**kwargs):
        context = super().get_context_data(**kwargs)
        cart_id = self.request.session.get("cart_id")
        if cart_id:
            cart = Cart.objects.get(id=cart_id)
        else:
            cart = None
        context['cart'] = cart
        return context