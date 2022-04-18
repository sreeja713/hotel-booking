
from django.db.models import Q
from django.http import HttpResponse
from django.shortcuts import render,redirect
from .forms import addCategoryForm,addSubcategoryForm,addRoomForm,booking_form,searching_form
from .models import Category,subCategory,Rooms,Order,LineItem,Booking
from django.contrib.auth.decorators import login_required, permission_required
from django.contrib import messages
from django.db import connection, reset_queries
# Create your views here.

@permission_required('room_management.admin_permisions',raise_exception=True)
def addCategory(request):
    if request.method=="GET":
        form=addCategoryForm()
        return render(request,'addcategory.html',{'form':form})
    elif request.method=="POST":
        form = addCategoryForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('show_category')
        else:
            return redirect("addCategory")

@permission_required('room_management.admin_permisions',raise_exception=True)
def show_category(request):
    category=Category.objects.all()
    return render(request,'show.html',{'category':category})

@permission_required('room_management.admin_permisions',raise_exception=True)
def delete(request,id):
    category=Category.objects.get(id=id)
    category.delete()
    messages.info(request, ('Something went wrong, Please try agian.'))
    return redirect('show_category')


#sub category started
@permission_required('room_management.admin_permisions',raise_exception=True)
def add_subcategory(request):
    if request.method=="GET":
        form=addSubcategoryForm()
        return render(request,'addsubcategory.html',{'form':form})
    elif request.method=="POST":
        form = addSubcategoryForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('show_subcategory')
        else:
            return redirect("add_subcategory")

@permission_required('room_management.admin_permisions',raise_exception=True)
def show_subcategory(request):
    subcategory=subCategory.objects.all()
    return render(request,'show_subcategory.html',{'subcategory':subcategory})


@permission_required('room_management.admin_permisions',raise_exception=True)
def subcategory_delete(request,id):
    product=subCategory.objects.get(id=id)
    product.delete()
    messages.success(request,'Successfully deleted')
    return redirect('show_subcategory')

#Room session started
@permission_required('room_management.admin_permisions',raise_exception=True)
def addroom(request):
    if request.method=="GET":
        form=addRoomForm()
        return render(request,'addroom.html',{'form':form})
    elif request.method=="POST":
        form=addRoomForm(request.POST,request.FILES)
        if form.is_valid():
            form.save()
            return redirect('showrooms')
        else:
            return redirect('addroom')

#show room details for admin
@permission_required('room_management.admin_permisions',raise_exception=True)
def showrooms(request):
    rooms=Rooms.objects.all()
    return render(request,'showrooms.html',{'rooms':rooms})

def room_delete(request,id):
    room=Rooms.objects.all()
    room.delete()
    messages.success(request,'Successfully deleted')
    return redirect('showrooms')

#rooms show to user
def usershow(request):
    if request.method=="GET":
        form=searching_form()
        rooms=Rooms.objects.filter(occupaid="False").all()
        context = {
            'rooms':rooms,
            'search_form' : form
        }
        return render(request,'roomoptions.html',context)
    elif request.method=="POST":
        form=searching_form(request.POST)
        if form.is_valid():
            print(form.cleaned_data)
            selected_category=int(form.cleaned_data.get("category"))
            selected_subcategory=int(form.cleaned_data.get("sub_category"))
            start_date = form.cleaned_data.get("start_date")
            end_date = form.cleaned_data.get("end_date")

            booked=Booking.objects.filter(status="Completed")
            booked=booked.filter(Q(starting_date__range=[start_date, end_date])|Q(ending_Date__range=[start_date, end_date])).values_list("room_number",flat=True)

            rooms=Rooms.objects
            if selected_category != 0:
                rooms = rooms.filter(caregory=selected_category)
            if selected_subcategory != 0:
                rooms = rooms.filter(subcategory=selected_subcategory)

            rooms = rooms.filter(~Q(id__in=booked))
            rooms = rooms.all()
            
        
            context = {
                'rooms':rooms,
                'search_form' : form
            }
            return render(request,'roomoptions.html',context)
        else:
            messages.error(request,'something error')
            context = {
                'rooms':None,
                'search_form' : form
            }
            return render(request,'roomoptions.html',context)

#show selected room details
@login_required(login_url='loginpage')            
def room_detais(request,id):
    if request.method=="GET":
        details=Rooms.objects.filter(id=id).all()

        form=booking_form()
        context={
            'details':details,
            'form':form
        }
        return render(request,'roomdetails.html',context)
    elif request.method=="POST":
        form=booking_form(request.POST)
        datas=Rooms.objects.filter(id=id).select_related('subcategory').first()
        roomcapacity=datas.subcategory.capacit
        if form.is_valid():
            st_date=form.cleaned_data.get("starting_date")
            end_date=form.cleaned_data.get("ending_date")
            number_of_days=end_date-st_date
            number_of_person=form.cleaned_data.get("Number_of_person")

            booked=Booking.objects.filter(room_number=id,status="Completed")
            booked=booked.filter(Q(starting_date__range=[st_date, end_date])|Q(ending_Date__range=[st_date, end_date])).exists()
            if booked==True:
                messages.info(request,'This choosen Room is not available for the above mentioned time')
                details=Rooms.objects.filter(id=id).all()
                context={
                'details':details,
                'form':form
                }
                return render(request,'roomdetails.html',context)
            else:
                if number_of_person<=roomcapacity:
                    details=Order()
                    details.user_id=request.user
                    details.status="On Processing"
                    details.order_total=datas.price*number_of_days.days
                    details.save()
                    lineitem=LineItem()
                    lineitem.order_id=details
                    lineitem.room_numb=datas
                    lineitem.category="Purchasing"
                    lineitem.price=datas.price  
                    lineitem.save() 

                    booking=Booking()
                    booking.order_id=details
                    booking.room_number=lineitem.room_numb
                    booking.user_id=request.user
                    booking.price=details.order_total
                    booking.starting_date=st_date
                    booking.ending_Date=end_date
                    booking.status="In Process"
                    booking.save()
                    return redirect('order_review',details.id)
                else:
                    details=Rooms.objects.filter(id=id).all()
                    messages.error(request,('Number of person is exceeds'))
                    context={
                    'details':details,
                    'form':form
                    }
                    return render(request,'roomdetails.html',context)




def order_review(request,id):
    if request.method=="GET":
        order_details=Order.objects.filter(id=id).select_related().first()
        lineitems = order_details.lineitem.all()
        booking_det = Booking.objects.filter(order_id=id).first()
        context = {
            'user' : request.user,
            'order_details' : order_details,
            'lineitems' : lineitems,
            "booking_det" : booking_det
        }
        
        return render(request,'order_review.html',context)
# Booking Part Started
# booking details  
def booking_completed(request,id):
    order_details=Order.objects.filter(id=id).select_related().first()
    order_details.status="Completed"
    order_details.save()
    booking=Booking.objects.filter(order_id=id).first()
    booking.status="Completed"
    booking.save()
    
    lineitems = order_details.lineitem.all()
    context = {
        'order_details' : order_details,
        'lineitems' : lineitems,
        "booking_det" : booking
    }
    return render(request,'booking_completed.html',context)

@login_required(login_url='loginpage')
def booking_cancel(request,id):
    order_details=Order.objects.filter(id=id).select_related().first()
    booking_details=Booking.objects.get(order_id=id)
    print("booking_details")
    booking_details.status="Cancel"
    booking_details.save()

    order_details.status="Cancel"
    order_details.save()
    print("success")
    return render(request,'booking_completed.html')


@login_required(login_url='loginpage')
def order_show_table(request):
    if request.method=="GET":
        order_details=Order.objects 
        if not request.user.is_superuser:
            order_details = order_details.filter(user_id=request.user)
        order_details = order_details.select_related().all()
        lineitem_details={}
        for items in order_details:
            lineItems=items.lineitem.all()
            lineitem_details[items.id] = lineItems[0]
            # lineitem_details.append(lineItems)
            print("line items=",lineItems)

        context={
            'order_details':order_details,
            'lineitem_details':lineitem_details
        }
        return render(request,'order_show_table.html',context)


#shhow user's whole booking datas
@login_required(login_url='loginpage')
def booking_data_show(request):
    if request.method=="GET":
        booking_details=Booking.objects
        if not request.user.is_superuser:
            print("hi")
            booking_details=booking_details.filter(user_id=request.user)
        booking_details=booking_details.all()
        print("it is",booking_details)

        context={
            'booking_details':booking_details,
            'is_admin' : request.user.is_staff
        }
        return render(request,'booking_data_show.html',context)


def check_in_handler(request,id):
    if request.method == "GET":
        room_details = Rooms.objects.filter(room_number=id).first()
        if room_details is not None:
            if room_details.occupaid == False:
                room_details.occupaid = True
                room_details.save()
                messages.success(request,('Successfully checked in.'))
            else:
                messages.error(request,('Invalid Operation. Room is already occupied'))
        else:
            messages.error(request,("Invalid Operation. Couldn't find the room"))
        return redirect('booking_data_show')


def check_out_handler(request,id):
    if request.method == "GET":
        room_details = Rooms.objects.filter(room_number=id).first()
        if room_details is not None:
            if room_details.occupaid == True:
                room_details.occupaid = False
                room_details.save()
                messages.success(request,('Successfully checked out.'))
            else:
                messages.error(request,('Invalid Operation. Room is already occupied'))
        else:
            messages.error(request,("Invalid Operation. Couldn't find the room"))
        return redirect('booking_data_show')
