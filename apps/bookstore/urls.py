from django.urls import path
from . import views


urlpatterns = [
    
    path('all_books/', views.all_books, name="all_books"),
    path('book_details/', views.book_details, name="book_details"),
    path('books/', views.books, name="books"),

]