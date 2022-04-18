from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth.models import User
from django import forms
from .models import UserDetails, GENDER
from django.forms.widgets import NumberInput
from django.core.validators import validate_integer

class SignUpForm(UserCreationForm):
    place = forms.CharField(required=True, label=("Place"))
    phone_number = forms.CharField(
        max_length=15, label=("Mobile"), required=True, validators=[validate_integer])
    gender = forms.ChoiceField(
        required=True, label=("Geneder"), choices=GENDER)
    date_of_birth = forms.DateField(required=True, label=(
        "Date Of Birth"), widget=NumberInput(attrs={'type': 'date'}))
    
    class Meta:
        model = User
        fields = ('first_name', 'last_name', 'email', 'username',
                  'password1', 'password2', )
        widgets = {
            # 'empid': forms.NumberInput(attrs={'class':'col-11 mb-3'}),
            'first_name':forms.TextInput(attrs={'class':'col-11 mb-3'}),
            'last_name':forms.TextInput(attrs={'class':'col-11 mb-3'}),
            'email': forms.EmailInput(attrs={'class':'col-11 mb-3'}),
            'username':forms.TextInput(attrs={'class':'col-11 mb-3'}),
            'password1':forms.PasswordInput(),
            'password2':forms.PasswordInput(attrs={'class':'col-11 mb-3'}),
        }


class custom_loginform(forms.Form):
    
    username=forms.CharField(max_length=255)
    password=forms.CharField(max_length=255)


