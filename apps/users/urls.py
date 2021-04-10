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
    path('credit-card-validate/', views.validate_credit_card, name='validate-card'),
    path('edit-card-validate/<int:pk>/', views.edit_credit_card, name='edit-card'),
    path('delete-card/<int:pk>/', views.delete_card, name='delete-card'),
    path('add-shipping-address/', views.add_shipping_address, name='add-ship'),
    path('edit-shipping-address/<int:pk>/', views.edit_shipping_address, name='edit-ship'),
    path('delete-shipping-address/<int:pk>/', views.delete_shipping_address, name='delete-ship'),
]
