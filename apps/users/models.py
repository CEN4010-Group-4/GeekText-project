from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.contrib.auth.models import Group


# Create your models here.

class CreditCard(models.Model):
    name_on_the_card = models.CharField(max_length=100)
    number = models.BigIntegerField()
    month = models.IntegerField()
    year = models.IntegerField()
    cvv = models.IntegerField()
    created_at = models.DateTimeField(auto_now_add=True)
    modified_at = models.DateTimeField(auto_now=True)
    card_issuer = models.CharField(max_length=50)

    def format_number(self):
        split_number = []
        for i in range(4):
            split_number.append(str(self.number)[i * 4: (i + 1) * 4])
        return " ".join(split_number)


class ShippingInformation(models.Model):
    home_address = models.CharField(max_length=50, null=True)
    street_address = models.CharField(max_length=50, null=True)
    city = models.CharField(max_length=50, null=True)
    state = models.CharField(max_length=50, null=True)


class Customer(models.Model):
    user = models.OneToOneField(User, null=True, blank=True, on_delete=models.CASCADE, related_name='customer')
    # name = models.CharField(max_length=200, null=True)
    # last_name = models.CharField(max_length=200, null=True, blank=True)
    # email = models.CharField(max_length=200, null=True)
    phone = models.CharField(max_length=200, null=True)
    city = models.CharField(max_length=200, null=True)
    address_1 = models.CharField(max_length=200, null=True)
    zip_code = models.CharField(max_length=5, null=True)
    date_created = models.DateTimeField(auto_now_add=True, null=True)
    sipping_information = models.ManyToManyField(ShippingInformation, blank=True, related_name='shipping_address')
    card_details = models.ManyToManyField(CreditCard, related_name='customer_cards')

    def __str__(self):
        # return str(self.user.username) #using this one
        return str(self.user.username)
        # return self.name

# Using signals to post_save data
#
# def customer_profile(sender, instance, created, **kwargs):
# 	if created:
# 		group = Group.objects.get(name='customer')
# 		instance.groups.add(group)
# 		Customer.objects.create(
# 			user=instance,
# 			name=instance.username,
# 			)
# 		print('Profile created!')
#
# post_save.connect(customer_profile, sender=User)

# # working using this 02-03-21
# def customer_profile(sender, instance, created, **kwargs):
#     if created:
#         group = Group.objects.get(name='customer')
#         instance.groups.add(group)
#         Customer.objects.create(
#             user=instance,
#             )
#         print('Profile created!')
#
# post_save.connect(customer_profile, sender=User)
