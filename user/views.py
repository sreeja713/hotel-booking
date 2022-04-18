
from django.http import HttpResponse
from django.shortcuts import render,redirect
from .forms import SignUpForm,custom_loginform
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth.models import Group
from django.contrib import messages
from .models import UserDetails
from django.contrib.auth import authenticate, logout,login
from django.contrib.auth.decorators import login_required
# Create your views here.


def home(request):
    return render(request,"home.html")

def signup(request):
    if request.method=="GET":
        form = SignUpForm()
        return render(request,"signup.html",{'form':form})
    else:
        form=SignUpForm(request.POST)
        if form.is_valid:
            user=form.save()
            if user:
                user.refresh_from_db() 
                user_group = Group.objects.get(name='User')
                user_group.user_set.add(user) 
                userdetails = UserDetails()
                userdetails.uid = user
                userdetails.phone_number = form.cleaned_data.get('phone_number')
                userdetails.place = form.cleaned_data.get('place')
                userdetails.date_of_birth = form.cleaned_data.get(
                    'birth_day',None)
                userdetails.gender = form.cleaned_data.get('gender')
                userdetails.save()
                print(userdetails)
                return redirect('loginpage')


            else:
                messages.error(
                    request, ('Something went wrong, Please try agian.'))
                return render(request, 'signup.html', {'form': form})
        else:
            messages.error(request, ('Something went wrong, Please try agian.'))
            return render(request, 'signup.html', {'form': form})
    

def loginpage(request):
    if request.method=="GET":
        form=AuthenticationForm()
        form.fields['username'].widget.attrs['class'] = "form-control"
        form.fields['password'].widget.attrs['class'] = "form-control"
        return render(request,"login.html",{'form':form})
    elif request.method=="POST":
        form=AuthenticationForm(None,request.POST)
        
        if form.is_valid():
            print(form.cleaned_data)

            username=form.cleaned_data.get("username")
            password=form.cleaned_data.get("password")
            user=authenticate(username=username, password=password)
            if user is not None:
                login(request, user)
                return redirect("home")
            else:
                messages.info(request,'invalid username or password')
                return redirect('loginpage')
        else:
            form.fields['username'].widget.attrs['class'] = "form-control"
            form.fields['password'].widget.attrs['class'] = "form-control"
            return render(request,"login.html",{'form':form})
    
@login_required(login_url='loginpage')
def logoutfunc(request):
    logout(request)
    print("\n logout\n")
    return redirect("home")