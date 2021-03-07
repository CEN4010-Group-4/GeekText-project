from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
<<<<<<< HEAD
    path('', include('apps.users.urls')),
    path('', include('apps.bookstore.urls')),
=======
    path('', include('apps.users.urls'))
>>>>>>> 177066ebb5d8e23012b4dd8af64f8d38b60611ea
]
