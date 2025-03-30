from django.shortcuts import render, get_object_or_404
from .models import *
from .serializers import *
from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework.views import APIView

from rest_framework.permissions import IsAuthenticated, IsAdminUser, AllowAny
from rest_framework.decorators import permission_classes

from django.contrib.auth.models import User, Group
from .permissions import *



# Create your views here.

@api_view()
@permission_classes([IsAuthenticated])
def me(request):
    return Response(request.user.email)

#-----------------------USER MANAGEMENT SECTION------------------------
@api_view(['GET', 'POST'])
@permission_classes([IsAdminUser])
def managers(request):
    managers = get_object_or_404(Group, name='manager') #---Ensures that the group exists
    if request.method == 'GET':
        managers_list = managers.user_set.all()
        serialized_managers = UserSerializer(managers_list, many=True)
        return Response({"managers" : serialized_managers.data}, status=status.HTTP_200_OK)
    
    elif request.method == 'POST':
        username = request.data.get('username')
        if not username:
            return Response({'message': 'Please provide a valid username'}, status=status.HTTP_400_BAD_REQUEST)
        user = get_object_or_404(User, username=username)
        managers = Group.objects.get(name='manager')
        managers.user_set.add(user)
        return Response({'message': 'User added to managers group'}, status=status.HTTP_201_CREATED)
    else:
        return Response({'message': 'Something went wrong, Bad request'}, status=status.HTTP_400_BAD_REQUEST)


@api_view(['DELETE'])
@permission_classes([IsAdminUser])
def delete_manager(request, userId):
    managers = Group.objects.get(name='manager')
    user = get_object_or_404(User, id=userId)
    if user:
        managers.user_set.remove(user)
        return Response({'message': 'User has been removed from managers group'}, status=status.HTTP_200_OK)
    else:
        return Response({'message': 'User does not exist'}, status=status.HTTP_400_BAD_REQUEST)
    

@api_view(['GET', 'POST'])
@permission_classes([IsAdminUser])
def delivery_crew(request):
    delivery_crew = get_object_or_404(Group, name='Delivery crew') #---Ensures that the group exists
    if request.method == 'GET':
        delivery_crew_list = delivery_crew.user_set.all()
        serialized_delivery_crew = UserSerializer(delivery_crew_list, many=True)
        return Response({"Delivery crew" : serialized_delivery_crew.data}, status=status.HTTP_200_OK)
    
    elif request.method == 'POST':
        username = request.data.get('username')
        if not username:
            return Response({'message': 'Please provide a valid username'}, status=status.HTTP_400_BAD_REQUEST)
        user = get_object_or_404(User, username=username)
        delivery_crew = Group.objects.get(name='Delivery crew')
        delivery_crew.user_set.add(user)
        return Response({'message': 'User added to Delivery crew group'}, status=status.HTTP_201_CREATED)
    else:
        return Response({'message': 'Something went wrong, Bad request'}, status=status.HTTP_400_BAD_REQUEST)
    

@api_view(['DELETE'])
@permission_classes([IsAdminUser])
def delete_delivery_crew(request, userId):
    delivery_crew = Group.objects.get(name='Delivery crew')
    user = get_object_or_404(User, id=userId)
    if user:
        delivery_crew.user_set.remove(user)
        return Response({'message': 'User has been removed from Delivery crew group'}, status=status.HTTP_200_OK)
    else:
        return Response({'message': 'User does not exist'}, status=status.HTTP_400_BAD_REQUEST)    





#-----------------------MENU ITEMS SECTION------------------------
@api_view(['GET', 'POST', 'PUT', 'PATCH' ,'DELETE'])
@permission_classes([AllowAny])
def menu_items(request):
    if request.method == 'GET':
        menu_items = MenuItem.objects.all()
        serialized_items = MenuItemsSerializer(menu_items, many=True)
        return Response(serialized_items.data, status=status.HTTP_200_OK)
    elif request.method == 'POST':
        if not is_manager(request.user):
            return Response({'message': 'You are not authorized to perform this action'}, status=status.HTTP_403_FORBIDDEN)
        
        serialzer = MenuItemsSerializer(data=request.data)
        if serialzer.is_valid():
            serialzer.save()
            return Response(serialzer.data, status=status.HTTP_201_CREATED)
        return Response(serialzer.errors, status=status.HTTP_400_BAD_REQUEST)
    return Response({'message' : 'There was an issue getting the items on the menu'})




@api_view()
@permission_classes([AllowAny])
def single_menu_item(request, menuItem):
    menu_item = get_object_or_404(MenuItem, id=menuItem)
    if request.method == 'GET':
        serialized_item = MenuItemsSerializer(menu_item)
        return Response(serialized_item.data, status=status.HTTP_200_OK)
    
    elif request.method in ['PUT', 'PATCH']:
        if not is_manager(request.user):
            return Response({'message': 'You are not authorized to perform this action'}, status=status.HTTP_403_FORBIDDEN)
        
        serialized_item = MenuItemsSerializer(menu_item, data=request.data)
        if serialized_item.is_valid():
            serialized_item.save()
            return Response(serialized_item.data, status=status.HTTP_200_OK)
        return Response(serialized_item.errors, status=status.HTTP_400_BAD_REQUEST)
    
    elif request.method == 'DELETE':
        if not is_manager(request.user):
            return Response({'message': 'You are not authorized to perform this action'}, status=status.HTTP_403_FORBIDDEN)
        
        menu_item.delete()
        return Response({'message': 'Item has been deleted'}, status=status.HTTP_200_OK)
    
    return Response({'message' : 'There was an issue getting the item on the menu'})





