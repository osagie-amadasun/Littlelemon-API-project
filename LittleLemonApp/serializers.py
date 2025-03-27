from rest_framework import serializers
from .models import *


class MenuItemsSerializer(serializers.ModelSerializer):

    class Meta:
         model = MenuItem
         fields = ['id', 'title', 'price', 'featured', 'category']