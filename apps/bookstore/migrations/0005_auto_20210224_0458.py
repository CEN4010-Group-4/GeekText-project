# Generated by Django 3.1.5 on 2021-02-24 04:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('bookstore', '0004_auto_20210224_0445'),
    ]

    operations = [
        migrations.AlterField(
            model_name='author',
            name='created',
            field=models.DateTimeField(),
        ),
    ]
