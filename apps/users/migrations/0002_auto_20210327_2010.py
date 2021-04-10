# Generated by Django 3.1.7 on 2021-03-27 19:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='CreditCard',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name_on_the_card', models.CharField(max_length=100)),
                ('number', models.BigIntegerField()),
                ('month', models.IntegerField()),
                ('year', models.IntegerField()),
                ('cvv', models.IntegerField()),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('modified_at', models.DateTimeField(auto_now=True)),
                ('card_issuer', models.CharField(max_length=50)),
            ],
        ),
        migrations.AddField(
            model_name='customer',
            name='card_details',
            field=models.ManyToManyField(related_name='customer_cards', to='users.CreditCard'),
        ),
    ]