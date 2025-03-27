from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('menu-items/', views.menu_items, name='menu-items'),
    path('menu-items/<int:menuItem>/', views.single_menu_item, name='single-menu-item')
]
