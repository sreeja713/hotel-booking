from django.urls import path
from . import views

urlpatterns = [
    path('addcategory', views.addCategory, name="addcategory"),
    path('show_category', views.show_category, name="show_category"),
    path('delete/<int:id>', views.delete,name="delete"),
    path('addcategory', views.addCategory, name="addcategory"),
    path('add_subcategory', views.add_subcategory, name="add_subcategory"),
    path('show_subcategory', views.show_subcategory, name="show_subcategory"),
    path('subcategory_delete/<int:id>', views.subcategory_delete,name="subcategory_delete"),
    path('addroom', views.addroom, name="addroom"),
    path('showrooms', views.showrooms, name="showrooms"),
    path('room_delete/<int:id>', views.room_delete,name="room_delete"),
    path('usershow', views.usershow, name="usershow"),
    path('room_detais/<int:id>', views.room_detais,name="room_detais"),
    # path('order_details/<int:id>', views.order_details, name="order_details"),
    path('order_review/<int:id>', views.order_review, name="order_review"),
    path('booking_completed/<int:id>', views.booking_completed, name="booking_completed"),
    path('booking_cancel/<int:id>', views.booking_cancel, name="booking_cancel"),
    path('order_show_table', views.order_show_table, name="order_show_table"),
    path('booking_data_show', views.booking_data_show, name="booking_data_show"),
    path('check-in/<slug:id>', views.check_in_handler, name="check_in"),
    path('check-out/<slug:id>', views.check_out_handler, name="check_out"),

]