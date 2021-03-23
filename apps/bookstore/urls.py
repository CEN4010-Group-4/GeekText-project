from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [
    
    path('all_books/', views.all_books, name="all_books"),
    path('book_details/', views.book_details, name="book_details"),
    path(r'^book_details/(?P<id>\d+)/$', views.book_details, name="book_details_with_pk"),
    path('books/', views.books, name="books"),
    path(r'^book_author/(?P<id>\d+)/$', views.book_author, name="book_author"),
     
    
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)