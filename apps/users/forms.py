from django.forms import ModelForm
from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from django.contrib.auth.models import User
from django import forms

from .models import *

class CreateUserForm(UserCreationForm):
    #fullname = forms.CharField(label="First name")
    class Meta:
        model = User
        fields = ['first_name','last_name','username', 'email', 'password1', 'password2'] #Python list

class EditProfileForm(UserChangeForm):
    #fullname = forms.CharField(label="First name")
    class Meta:
        model = User
        fields = ['first_name','last_name','username', 'email'] #Python list

class CustomerForm(ModelForm):
    class Meta:
        model = Customer
        #fields = '__all__'
        exclude = ['user']


# added model to present data to customers

class UserForm(ModelForm):
    class Meta:
        model = User
        fields = [
            'username',
            'first_name',
            'last_name',
            'email'
        ]
        widgets = {
            'username': forms.TextInput(attrs={'readonly': True }),
            'first_name': forms.TextInput(attrs={'readonly': True }),
            'last_name': forms.TextInput(attrs={'readonly': True }),
            'email': forms.TextInput(attrs={'readonly': True }),
        }
        help_texts = {
            'username': ''
        }

# model to view data only not edit 
# class UserForm(ModelForm):
#     class Meta:
#         model = User
#         fields = [
#             'username',
#             'first_name',
#             'last_name',
#             'email'
#         ]
