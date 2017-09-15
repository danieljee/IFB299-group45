from django import forms
from .models import User
from django.utils.translation import ugettext_lazy as _
class LogInForm(forms.Form):
    email = forms.CharField(
        label='Email:',
        max_length=100,
        widget=forms.TextInput(attrs={'class':'form-control', 'placeholder':'example@example.com'})
    )
    password = forms.CharField(
        label='Password:',
        widget=forms.PasswordInput(attrs={'class':'form-control', 'placeholder':'password'})
    )

class SignUpForm(forms.ModelForm):
    class Meta:
        model = User
        fields = '__all__'
        widgets = {
            'firstName': forms.TextInput(attrs={'class':'form-control'}),
            'lastName': forms.TextInput(attrs={'class':'form-control'}),
            'emailAddress': forms.TextInput(attrs={'class':'form-control'}),
            'password': forms.PasswordInput(attrs={'class':'form-control'}),
            'address': forms.TextInput(attrs={'class':'form-control'}),
            'postcode': forms.TextInput(attrs={'class':'form-control'}),
            'role': forms.RadioSelect(),
        }
