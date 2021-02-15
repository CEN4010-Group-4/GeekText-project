from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.contrib.auth.models import Group

# Create your models here.

class Customer(models.Model):
    user = models.OneToOneField(User, null=True, blank=True,on_delete=models.CASCADE)
    #name = models.CharField(max_length=200, null=True)
    #last_name = models.CharField(max_length=200, null=True, blank=True)
    phone = models.CharField(max_length=200, null=True)
    #email = models.CharField(max_length=200, null=True)
    city = models.CharField(max_length=200, null=True)
    address_1 = models.CharField(max_length=200, null=True)
    zip_code = models.CharField(max_length=5, null=True)
    date_created = models.DateTimeField(auto_now_add=True, null=True)

    def __str__(self):
        #return str(self.user.username) #using this one
        return str(self.user.username)
        #return self.name




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
