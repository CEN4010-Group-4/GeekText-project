from django.contrib import admin
from .models import Genre, Product, Author


@admin.register(Genre) # class to show fields of genre in django admin
class CategoryAdmin(admin.ModelAdmin):
    list_display = ['name', 'slug']
    prepopulated_fields = {'slug': ('name',)}

@admin.register(Product) # class to show fields of products in django admin
class ProductAdmin(admin.ModelAdmin):
    list_display = ['name', 'slug', 'price', 'publisher', 'release_date','created', 'updated']
    list_filter = ['created', 'updated', 'publisher']
    list_editable = ['price']
    prepopulated_fields = {'slug': ('name',)}
    
@admin.register(Author) # class to show fields of authors in django admin
class AuthorAdmin(admin.ModelAdmin):
    list_display = ['first_name', 'last_name','biography']
    search_fields = ['pk','first_name', 'last_name']
