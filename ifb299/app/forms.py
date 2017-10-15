from django import forms
from django.contrib.auth.models import User
from .models import UserProfile
from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from django.utils.translation import ugettext_lazy as _

class MyRegistrationForm(forms.ModelForm):
    email = forms.EmailField(required=True, widget=forms.TextInput(attrs={'class':'form-control'}))
    class Meta:
        model = User
        fields = ('username', 'email', 'first_name', 'last_name', 'password')
        widgets = {
            'first_name': forms.TextInput(attrs={'class':'form-control'}),
            'last_name': forms.TextInput(attrs={'class':'form-control'}),
            'password': forms.PasswordInput(attrs={'class':'form-control'}),
            'username': forms.TextInput(attrs={'class':'form-control'}),
        }

class UserProfileForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ('address', 'phone_number', 'postcode', 'role')
        widgets = {
            'address': forms.TextInput(attrs={'class':'form-control'}),
            'phone_number': forms.NumberInput(attrs={'class':'form-control'}),
            'postcode': forms.NumberInput(attrs={'class':'form-control'}),
            'role': forms.Select(attrs={'class':'form-control'}),
        }
        
class UpdateUserForm(forms.ModelForm):
    email = forms.EmailField(required=True)
    first_name = forms.CharField(max_length=30, required=False)
    last_name = forms.CharField(max_length=30, required=False)
    class Meta:
        model = User
        model = UserProfile
        fields = ('email', 'first_name', 'last_name', 'phone_number','phone_number', 'postcode', 'role')

class ReviewForm(forms.ModelForm):
    class Meta:
        model = User
        model = Place
        model = Review
        fields = ('user', 'place_id', 'comments', 'rating')
