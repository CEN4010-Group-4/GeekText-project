# Generated by Django 3.1.5 on 2021-02-24 04:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('bookstore', '0005_auto_20210224_0458'),
    ]

    operations = [
        migrations.AlterField(
            model_name='author',
            name='created',
            field=models.DateTimeField(auto_now=True),
        ),
    ]
