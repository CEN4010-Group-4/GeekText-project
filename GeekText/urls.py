from django.contrib import admin
from django.urls import path, include
from django.shortcuts import render
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('apps.users.urls')),
    path('', include('apps.bookstore.urls')),
    
    
    
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
