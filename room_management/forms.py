
from django.forms import ModelForm
from .models import Category,subCategory,Rooms
from django import forms
from django.forms.widgets import NumberInput

class addCategoryForm(ModelForm):
    class Meta:
        model = Category
        fields ='__all__'

    

class addSubcategoryForm(ModelForm):
    class Meta:
        model = subCategory
        fields ='__all__'

    
class addRoomForm(ModelForm):
    class Meta:
        model = Rooms
        fields ='__all__'


    
class booking_form(forms.Form):
    starting_date=forms.DateField(widget = forms.SelectDateWidget())
    ending_date=forms.DateField(widget = forms.SelectDateWidget())
    Number_of_person=forms.IntegerField()


CATEGORY = (
    (0, "Any"),
    (1, 'AC'),
    (4, 'Non AC'),
)

SUB_CATEGORY = (
    (0, "Any"),
    (1, 'Single Room'),
    (2, 'Double Room'),
)

class searching_form(forms.Form):
    start_date = forms.DateField(required=True, label=
        "Start Date", widget=NumberInput(attrs={'type': 'date'}))
    end_date = forms.DateField(required=True, label=
        "End Date", widget=NumberInput(attrs={'type': 'date'}))
    category = forms.ChoiceField(
        required=True, label="Room Category", choices=CATEGORY)
    sub_category = forms.ChoiceField(
        required=True, label="Room Type", choices=SUB_CATEGORY)
    