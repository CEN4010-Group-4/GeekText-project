# Generated by Django 3.1.7 on 2021-03-24 01:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('bookstore', '0010_cart_cartproduct'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='image',
            field=models.ImageField(blank=True, upload_to='media/static'),
        ),
    ]
