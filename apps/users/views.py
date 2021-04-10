from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from django.contrib.auth.forms import UserCreationForm, UserChangeForm
# from django.urls import reverse_lazy
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import Group
from django.contrib import messages
from django.contrib.auth.decorators import login_required  # in order to restrict views, login decorators
from django.views.generic.base import TemplateView

# Create your views here.
from .models import *
from .forms import CreateUserForm, EditProfileForm, CustomerForm, UserForm
from .utils import ValidateLuhnChecksum, get_network
from apps.users.models import CreditCard, Customer, ShippingInformation
from .decorators import unauthenticated_user, allowed_users, admin_only


def home(request):
    return render(request, 'bookstore/home.html')


def books(request):
    return render(request, 'bookstore/books.html')


def cart(request):
    return render(request, 'bookstore/cart.html')


@unauthenticated_user
def registerPage(request):
    form = CreateUserForm()
    if request.method == 'POST':
        form = CreateUserForm(request.POST)
        if form.is_valid():
            user = form.save()
            username = form.cleaned_data.get('username')
            # group = Group.objects.get(name ='customer') # replaced with signals on models.py
            # user.groups.add(group)
            # Customer.objects.create(
            # user=user,
            # name=user.username,
            # )
            messages.success(request, 'Hello ' + username + ' Your account has been created')
            Customer.objects.create(user=user) # Create customer object
            return redirect('login')

    context = {'form': form}
    return render(request, 'users/register.html', context)


@unauthenticated_user
def loginPage(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)
            return redirect('profile')
        else:
            messages.info(request, 'Username or Password is Incorrect')
            messages.info(request, 'Please Try Again')
    context = {}
    return render(request, 'users/login.html', context)


def logoutUser(request):
    logout(request)
    return redirect('login')


@login_required(login_url='login')  # in order to restrict views, login decorators
def profile(request):
    # contex = {}
    cards = CreditCard.objects.filter(customer_cards__user=request.user)
    shipping_address = ShippingInformation.objects.filter(shipping_address__user=request.user)
    print(cards, shipping_address)
    return render(request, 'users/profile.html', {'cards': cards, 'shipping_address': shipping_address})


def base(request):
    # contex = {}
    return render(request, 'users/base.html')


@login_required(login_url='login')  # in order to restrict views, login decorators
def edit_profile(request):
    cus = Customer.objects.get(user=request.user)
    if request.method == 'POST':
        form = EditProfileForm(request.POST, instance=request.user)
        if form.is_valid():
            addr = form.cleaned_data['address_1']
            city = form.cleaned_data['city']
            phone = form.cleaned_data['phone']
            zip_code = form.cleaned_data['zip_code']
            form.save()
            cus.address_1 = addr
            cus.city = city
            cus.zip_code = zip_code
            cus.phone = phone
            cus.save()
            return redirect('profile')
    else:
        form = EditProfileForm(instance=request.user, initial={'phone': cus.phone, 'address_1':cus.address_1, 'city': cus.city, 'zip_code': cus.zip_code})
        args = {'form': form}
        return render(request, 'users/edit_profile.html', args)


def userPage(request):
    context = {}
    return render(request, 'users/user.html', context)



@login_required(login_url='login')  # in order to restrict views, login decorators
def customer(request):
    user = request.user

    cards = CreditCard.objects.filter(customer_cards__user=request.user)
    shipping_address = ShippingInformation.objects.filter(shipping_address__user=request.user)

    if request.method == 'POST':

        # create customer
        customer_form = CustomerForm(request.POST)

        # check if customer already exists
        # this allows customer details to be edited
        # also stops unique key error if creating a customer for a user that already has a customer object
        try:
            customer = Customer.objects.get(user=user)
            customer_form = CustomerForm(request.POST, instance=customer)
        except Customer.DoesNotExist:
            customer_form = CustomerForm(request.POST)

        if customer_form.is_valid():
            customer = customer_form.save(commit=False)
            customer.user = user
            customer.save()

        # returning HttpResponse else you will reload the same page
        return HttpResponse("Information Successfully Updated")

    user_form = UserForm(instance=user)

    customer_form = CustomerForm()

    try:
        customer = Customer.objects.get(user=user)
        customer_form = CustomerForm(instance=customer)
    except Customer.DoesNotExist:
        customer_form = CustomerForm()

    context = {
        'user_form': user_form,
        'customer_form': customer_form,
        'cards': cards,
        'shipping_address': shipping_address
    }

    return render(request, 'users/customer.html', context)


# def UserEditView(generic.UpdateView):
#    form_class = UserChangeForm
#    template_name = 'first_app/edit_profile.html'
# success_url = reverse_lazy('')

# def products(request):    function to return http response
#    return HttpRespons e('products')

# def customer(request):
#    return HttpResponse('customer')


def validate_credit_card(request):
    if request.is_ajax():
        number = request.POST.get('card_number')
        status = ValidateLuhnChecksum("".join(number.split(" ")))
        return JsonResponse({'status': status})
    else:
        if request.method == 'POST':
            kwargs = {
                'name_on_the_card': request.POST.get('name'),
                'number': int(request.POST.get('number').replace(" ", "")),
                'month': request.POST.get('month'),
                'year': request.POST.get('year'),
                'cvv': request.POST.get('cvv'),
                'card_issuer': get_network(str(request.POST.get('number')))
            }
            card_obj = CreditCard.objects.create(**kwargs)
            try:
                profile = Customer.objects.get(user=request.user)
            except Customer.DoesNotExist:
                profile = Customer.objects.create(user=request.user)
            profile.card_details.add(card_obj)
        return redirect('/profile/')


def edit_credit_card(request, pk):
    if request.is_ajax():
        number = request.POST.get('card_number')
        status = ValidateLuhnChecksum("".join(number.split(" ")))
        return JsonResponse({'status': status})
    else:
        if request.method == 'POST':
            card_obj = CreditCard.objects.filter(customer_cards__user=request.user, pk=pk)
            kwargs = {
                'name_on_the_card': request.POST.get('name'),
                'number': int(request.POST.get('number').replace(" ", "")),
                'month': request.POST.get('month'),
                'year': request.POST.get('year'),
                'cvv': request.POST.get('cvv'),
                'card_issuer': get_network(str(request.POST.get('number')))
            }
            card_obj.update(**kwargs)
        return redirect('/profile/')


def delete_card(request, pk):
    card = CreditCard.objects.get(customer_cards__user=request.user, pk=pk)
    card.delete()
    return redirect('/profile/')


def add_shipping_address(request):
    if request.method == 'POST':
        dict_obj = dict()
        for key in request.POST.keys():
            dict_obj[key] = request.POST.get(key)
        del dict_obj['csrfmiddlewaretoken']
        ship_obj = ShippingInformation.objects.create(**dict_obj)
        try:
            profile = Customer.objects.get(user=request.user)
        except Customer.DoesNotExist:
            profile = Customer.objects.create(user=request.user)
        profile.sipping_information.add(ship_obj)
    return redirect('/profile/')


def edit_shipping_address(request, pk):
    if request.method == 'POST':
        ship = ShippingInformation.objects.filter(shipping_address__user=request.user, pk=pk)
        dict_obj = dict()
        for key in request.POST.keys():
            dict_obj[key] = request.POST.get(key)
        del dict_obj['csrfmiddlewaretoken']
        ship.update(**dict_obj)
    return redirect('/profile/')


def delete_shipping_address(request, pk):
    ship = ShippingInformation.objects.get(shipping_address__user=request.user, pk=pk)
    ship.delete()
    return redirect('/profile/')
