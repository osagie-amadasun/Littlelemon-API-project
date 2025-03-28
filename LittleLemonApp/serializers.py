from rest_framework import serializers
from .models import *


class MenuItemsSerializer(serializers.ModelSerializer):

    class Meta:
         model = MenuItem
         fields = ['id', 'title', 'price', 'featured', 'category']


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'email', 'first_name', 'last_name']