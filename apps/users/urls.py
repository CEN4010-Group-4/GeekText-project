from django.urls import path
from . import views


urlpatterns = [
    path('', views.home),
    path('home/', views.home, name="home"),
    path('books/', views.books, name="books"),
    path('register/', views.registerPage, name="register"),
    path('login/', views.loginPage, name="login"),
    path('logout/', views.logoutUser, name="logout"),
    path('profile/', views.profile, name="profile"),
    path('edit_profile/', views.edit_profile, name="edit_profile"),
    path('base/', views.base, name="base"),
    path('user/', views.userPage, name="user-page"),
    path('customer/', views.customer, name="customer"),
<<<<<<< HEAD
    
=======
>>>>>>> 177066ebb5d8e23012b4dd8af64f8d38b60611ea

]
