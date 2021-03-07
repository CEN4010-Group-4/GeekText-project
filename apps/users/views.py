from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.forms import UserCreationForm, UserChangeForm
#from django.urls import reverse_lazy
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import Group
from django.contrib import messages
from django.contrib.auth.decorators import login_required # in order to restrict views, login decorators

# Create your views here.
from .models import *
from .forms import CreateUserForm, EditProfileForm, CustomerForm, UserForm
from .decorators import unauthenticated_user, allowed_users, admin_only
def home(request):
    return render(request,'bookstore/home.html')

def books(request):
    
    return render(request,'bookstore/books.html')
    




@unauthenticated_user
def registerPage(request):

    form = CreateUserForm()
    if request.method == 'POST':
        form = CreateUserForm (request.POST)
        if form.is_valid():
            user = form.save()
            username = form.cleaned_data.get('username')

            #group = Group.objects.get(name ='customer') # replaced with signals on models.py
            #user.groups.add(group)
            #Customer.objects.create(
            #user=user,
            #name=user.username,
            #)

            messages.success(request,'Hello ' + username + ' Your account has been created')
            return redirect('login')

    context = {'form':form}
    return render(request,'users/register.html', context)

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
    return render(request,'users/login.html', context)

def logoutUser(request):
    logout(request)
    return redirect('login')

@login_required(login_url='login') # in order to restrict views, login decorators
def profile(request):
    #contex = {}
    return render(request,'users/profile.html')

def base(request):
    #contex = {}
    return render(request,'users/base.html')

@login_required(login_url='login') # in order to restrict views, login decorators
def edit_profile(request):
    if request.method == 'POST':
        form = EditProfileForm(request.POST, instance=request.user)
        if form.is_valid():
            form.save()
            return redirect('profile')
    else:
        form = EditProfileForm(instance=request.user)
        args = {'form': form}
        return render(request, 'users/edit_profile.html', args)

def userPage(request):
    context = {}
    return render(request, 'users/user.html', context)

@login_required(login_url='login') # in order to restrict views, login decorators
def customer(request):

    user = request.user

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
        'customer_form': customer_form
        }

    return render(request, 'users/customer.html', context)



#def UserEditView(generic.UpdateView):
#    form_class = UserChangeForm
#    template_name = 'first_app/edit_profile.html'
    #success_url = reverse_lazy('')

#def products(request):    function to return http response
#    return HttpRespons e('products')

#def customer(request):
#    return HttpResponse('customer')
