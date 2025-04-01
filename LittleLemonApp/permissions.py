from rest_framework import status
from rest_framework.response import Response
from django.contrib.auth.models import Group

def is_manager(user):
    return user.is_authenticated and user.groups.filter(name='manager').exists()
    
def is_delivery_crew(user):
    return user.is_authenticated and user.groups.filter(name='delivery_crew').exists()

def is_customer(user):
    return user.is_authenticated and not user.groups.filter(name='manager').exists() and not user.groups.filter(name='delivery_crew').exists()