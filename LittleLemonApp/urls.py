from django.urls import path
from . import views


urlpatterns = [
    path('menu-items', views.menu_items, name='menu-items'),
    path('menu-items/<int:menuItem>', views.single_menu_item, name='single-menu-item'),
    path('me', views.me, name='me'),
    
    path('groups/manager/users', views.managers, name='manager-users'),
    path('groups/manager/users/<int:userId>', views.delete_manager, name='delete-manager'),
    path('groups/delivery-crew/users', views.delivery_crew, name='delivery-crew-users'),
    path('groups/delivery-crew/users/<int:userId>', views.delete_delivery_crew, name='delete-delivery-crew-users'),
    
    path('cart/menu-items', views.cart, name='cart-menu-items'),
    
    path('orders', views.order_list, name='orders'),
    path('orders/<int:orderId>', views.order_detail, name='order-detail')
]
