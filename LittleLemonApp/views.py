import datetime
from django.shortcuts import render, get_object_or_404
from .models import *
from .serializers import *
from .permissions import *
from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view, permission_classes, throttle_classes
from rest_framework.views import APIView

from rest_framework.permissions import IsAuthenticated, IsAdminUser, AllowAny

from django.contrib.auth.models import User, Group
from django.core.paginator import Paginator, EmptyPage

from rest_framework.throttling import UserRateThrottle, AnonRateThrottle


# Create your views here.

@api_view()
@permission_classes([IsAuthenticated])
def me(request):
    return Response(request.user.email)

#-----------------------USER MANAGEMENT SECTION------------------------
@api_view(['GET', 'POST'])
@permission_classes([IsAuthenticated])
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
@permission_classes([IsAuthenticated])
def delete_manager(request, userId):
    managers = Group.objects.get(name='manager')
    user = get_object_or_404(User, id=userId)
    if user:
        managers.user_set.remove(user)
        return Response({'message': 'User has been removed from managers group'}, status=status.HTTP_200_OK)
    else:
        return Response({'message': 'User does not exist'}, status=status.HTTP_400_BAD_REQUEST)
    

@api_view(['GET', 'POST'])
@permission_classes([IsAuthenticated])
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
@permission_classes([IsAuthenticated])
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
@permission_classes([IsAuthenticated])
@throttle_classes([UserRateThrottle, AnonRateThrottle])
def menu_items(request):
    menu_items = MenuItem.objects.select_related('category').all()
    
    #Filtering and searching block
    category_slug = request.query_params.get('category')
    price = request.query_params.get('to_price')
    search = request.query_params.get('search')
    ordering = request.query_params.get('ordering')
    
    #Pagination block
    perpage = request.query_params.get('perpage', default=10)
    page = request.query_params.get('page', default=1)
    
    #Filtering conditionals
    if  category_slug:
        menu_items = menu_items.filter(category__slug__exact=category_slug)
    if  price:
        try:
            menu_items = menu_items.filter(price__lte=float(price))
        except ValueError:
            return Response({'message': 'Invalid price format. Must be a float.'}, status=status.HTTP_400_BAD_REQUEST)
    
    if  search:
        menu_items = menu_items.filter(title__icontains=search)
    
    if ordering:
        menu_items = menu_items.order_by(ordering)
    
    #Paginator conditional and error handling
    Paginator = Paginator(menu_items, per_page=perpage)
    try:
        menu_items = Paginator.page(number=page)
    except EmptyPage:
        menu_items = []


    
    if request.method == 'GET':
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
@permission_classes([IsAuthenticated])
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




#--------------------CART MANAGEMENT SECTION--------------------
@api_view(['GET', 'POST', 'DELETE'])
@permission_classes([IsAuthenticated])
def cart(request):
    # Retrieve all cart items for the authenticated user
    cart_items = Cart.objects.filter(user=request.user)
    if request.method == 'GET':
        # Make sure you have a CartSerializer defined
        # from .serializers import CartSerializer
        serialized_cart = CartSerializer(cart_items, many=True)
        return Response(serialized_cart.data, status=status.HTTP_200_OK)

    elif request.method == 'POST':
        menu_item_id = request.data.get('menuitem')
        quantity_str = request.data.get('quantity') # Keep as string for validation first

        # --- Input Validation ---
        if not menu_item_id or not quantity_str:
            return Response({'message': 'MenuItem ID and quantity are required.'}, status=status.HTTP_400_BAD_REQUEST)

        try:
            quantity = int(quantity_str)
            if quantity <= 0:
                return Response({'message': 'Quantity must be a positive integer.'}, status=status.HTTP_400_BAD_REQUEST)
        except (ValueError, TypeError):
            return Response({'message': 'Invalid quantity format. Must be an integer.'}, status=status.HTTP_400_BAD_REQUEST)
        # --- End Input Validation ---

        # Fetch the menu item
        # Use 'id' if menu_item_id is the primary key, or 'pk'
        menu_item = get_object_or_404(MenuItem, id=menu_item_id)

        # --- Use update_or_create ---
        cart_item, created = Cart.objects.update_or_create(
            user=request.user,      # Lookup field 1
            menuitem=menu_item,     # Lookup field 2
            defaults={              # Fields to set/update
                "quantity": quantity,
                # Set unit_price from the MenuItem's price
                "unit_price": menu_item.price,
                # Calculate total price based on MenuItem's price and quantity
                "price": menu_item.price * quantity
            }
        )
        # --- End update_or_create ---

        if created:
            message = "Item added to cart successfully."
            status_code = status.HTTP_201_CREATED
        else:
            message = "Cart item quantity updated."
            status_code = status.HTTP_200_OK # Update: 200 OK is conventional

        return Response({"message": message}, status=status_code)

    elif request.method == 'DELETE':
        # Delete all cart items for the current user
        Cart.objects.filter(user=request.user).delete()
        return Response({"message": "All items removed from cart"}, status=status.HTTP_204_NO_CONTENT)



@api_view(['GET', 'POST', 'PUT', 'PATCH', 'DELETE'])
@permission_classes([IsAuthenticated])
def order_list(request):
    if request.method == 'GET':
        #RBAC management
        if is_customer(request.user):
            orders = Order.objects.filter(user=request.user)
        elif is_manager(request.user):
            orders = Order.objects.all()
        elif is_delivery_crew(request.user):
            orders = Order.objects.filter(delivery_crew=request.user)
        else:
            return Response({'message': 'You are not authorized to perform this action'}, status=status.HTTP_403_FORBIDDEN)
        
        serialized_orders = OrderSerializer(orders, many=True)
        return Response(serialized_orders.data, status=status.HTTP_200_OK)
    
    elif request.method == 'POST':
        #RBAC management
        if is_customer(request.user):
            cart_items = Cart.objects.filter(user=request.user)
            if not cart_items:
                return Response({'message': 'Your cart is empty.'}, status=status.HTTP_400_BAD_REQUEST)
            
            total = sum(item.price for item in cart_items)
            order = Order.objects.create(user=request.user, total=total, date=datetime.date.today())
        
            for item in cart_items:
                OrderItem.objects.create(
                    order=order,
                    menuitem=item.menuitem,
                    quantity=item.quantity,
                    unit_price=item.unit_price,
                    price=item.price
                )
            cart_items.delete()
            serializer = OrderSerializer(order)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response({'message': 'You are not authorized to perform this action'}, status=status.HTTP_403_FORBIDDEN)
        


@api_view(['GET', 'PUT', 'PATCH', 'DELETE'])
@permission_classes([IsAuthenticated])
def order_detail(request, orderId):
    order = get_object_or_404(Order, pk=orderId)

    if request.method == 'GET':
        if is_customer(request.user) and order.user == request.user:
            serializer = OrderSerializer(order)
            return Response(serializer.data)

        elif is_manager(request.user) or is_delivery_crew(request.user):
          serializer = OrderSerializer(order)
          return Response(serializer.data)

        else:
            return Response({"detail": "You do not have permission to view this order."}, status=status.HTTP_403_FORBIDDEN)

    elif request.method == 'PUT' or request.method == 'PATCH':
        if is_manager(request.user):
            serializer = OrderSerializer(order, data=request.data, partial=True)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        elif is_delivery_crew(request.user) and order.delivery_crew == request.user:
            if 'status' in request.data:
                serializer = OrderSerializer(order, data={'status':request.data['status']}, partial=True)
                if serializer.is_valid():
                  serializer.save()
                  return Response(serializer.data)
                return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
            else:
                return Response({"detail": "delivery crew can only update status"}, status=status.HTTP_403_FORBIDDEN)

        else:
            return Response({"detail": "You do not have permission to update this order."}, status=status.HTTP_403_FORBIDDEN)

    elif request.method == 'DELETE':
        if is_manager(request.user):
            order.delete()
            return Response(status=status.HTTP_204_NO_CONTENT)
        else:
            return Response({"detail": "You do not have permission to delete this order."}, status=status.HTTP_403_FORBIDDEN)