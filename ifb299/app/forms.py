from django import forms
from .models import User
from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from django.utils.translation import ugettext_lazy as _
class LogInForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ('email', 'password')
        widgets = {
            'email': forms.TextInput(attrs={'class':'form-control', 'name':'username'}),
            'password': forms.PasswordInput(attrs={'class':'form-control'}),
        }

class SignUpForm(forms.ModelForm):

    class Meta:
        model = User
        fields = ['email', 'first_name', 'last_name', 'phone_number', 'address', 'postcode', 'role', 'password']
        exclude = ['username']
        widgets = {
            'email': forms.TextInput(attrs={'class':'form-control'}),
            'first_name': forms.TextInput(attrs={'class':'form-control'}),
            'last_name': forms.TextInput(attrs={'class':'form-control'}),
            'password': forms.PasswordInput(attrs={'class':'form-control'}),
            'address': forms.TextInput(attrs={'class':'form-control'}),
            'postcode': forms.TextInput(attrs={'class':'form-control'}),
            'phone_number': forms.TextInput(attrs={'class':'form-control'}),
            'role': forms.RadioSelect(),
        }
    def save(self, commit=True):
        instance = super(SignUpForm, self).save(commit=False)

        # automatically set to email address to create a unique identifier
        instance.username = instance.email
        instance.set_password(instance.password)
        if commit:
            instance.save()

        return instance

class ChangeForm(UserCreationForm):
    def __init__(self, *args, **kargs):
        super(SignUpForm, self).__init__(*args, **kargs)
        del self.fields['username']

    class Meta:
        model = User
        fields = '__all__'

# class UserForm(forms.ModelForm):
#     class Meta:
#         model = User
#         fields = '__all__'
#         widgets = {
#             'email': forms.TextInput(attrs={'class':'form-control'}),
#             'first_name': forms.TextInput(attrs={'class':'form-control'}),
#             'last_name': forms.TextInput(attrs={'class':'form-control'}),
#             'password': forms.PasswordInput(attrs={'class':'form-control'}),
#             'address': forms.TextInput(attrs={'class':'form-control'}),
#             'postcode': forms.TextInput(attrs={'class':'form-control'}),
#             'phone_number': forms.TextInput(attrs={'class':'form-control'}),
#             'role': forms.RadioSelect(),
#         }
