from django.shortcuts import render, get_object_or_404
from .models import *
from .serializers import *
from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework.views import APIView



# Create your views here.
@api_view(['GET'])
def home(request):
    return Response({'message': 'Welcome to Little Lemon API'}, status=status.HTTP_200_OK)


@api_view(['GET', 'POST'])
def menu_items(request):
    if request.method == 'GET':
        menu_items = MenuItem.objects.all()
        serialized_items = MenuItemsSerializer(menu_items, many=True)
        return Response(serialized_items.data, status=status.HTTP_200_OK)
    
    elif request.method == 'POST':
        serializer = MenuItemsSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET', 'POST', 'PUT', 'PATCH', 'DELETE'])
def single_menu_item(request, menuItem):
    menu_item = get_object_or_404(MenuItem, id=menuItem)
    serialized_item = MenuItemsSerializer(menu_item)
    return Response(serialized_item.data, status=status.HTTP_200_OK)