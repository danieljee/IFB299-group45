from django.contrib.auth.models import User
from django import forms
from .models import Users

class UserForm(forms.ModelForm):
	password = forms.CharField(widget=forms.PasswordInput)
	class Meta:
		model = Users
		fields = ['username', 'first_name', 'last_name', 'email', 'password', 'address', 'phone_number']
		user_choices = [('student', 'Student'), ('tourist', 'Tourist'), ('business', 'Business')]
		account_type = forms.ChoiceField(widget=forms.RadioSelect, choices=user_choices)
