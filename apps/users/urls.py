from django.urls import path
from . import views
from ..bookstore.views import SearchView, cart, AddToCartView, ChangeCartView




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
    path('search/', SearchView.as_view(), name="search"),
    path('cart/', cart.as_view(), name="cart"),
    path("add-to-cart-<int:pro_id>/",AddToCartView.as_view(), name="addtocart"),
    path("change-cart/<int:cp_id>/",ChangeCartView.as_view(), name = "changecart"),

]
