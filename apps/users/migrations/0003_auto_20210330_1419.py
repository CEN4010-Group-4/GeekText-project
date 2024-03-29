# Generated by Django 3.1.7 on 2021-03-30 13:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0002_auto_20210327_2010'),
    ]

    operations = [
        migrations.AddField(
            model_name='customer',
            name='home_address',
            field=models.CharField(max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='customer',
            name='street_address',
            field=models.CharField(max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='customer',
            name='street_city_address',
            field=models.CharField(max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='customer',
            name='street_state_address',
            field=models.CharField(max_length=50, null=True),
        ),
    ]
