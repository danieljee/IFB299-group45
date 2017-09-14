from django import forms

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

class SignUpForm(forms.Form):
    firstName = forms.CharField(
        label='First Name:',
        max_length=100,
        widget=forms.TextInput(attrs={'class':'form-control'})
    )
    lastName = forms.CharField(
        label='Last Name:',
        max_length=100,
        widget=forms.TextInput(attrs={'class':'form-control'})
    )
    email = forms.CharField(
        label='Email:',
        max_length=100,
        widget=forms.TextInput(attrs={'class':'form-control'})
    )
    password = forms.CharField(
        label='Password:',
        widget=forms.PasswordInput(attrs={'class':'form-control'}),
        max_length=100
    )
    address = forms.CharField(
        label='Address:',
        max_length=100,
        widget=forms.TextInput(attrs={'class':'form-control'})
    )
    postcode = forms.CharField(
        label='postcode:',
        max_length=4,
        widget=forms.TextInput(attrs={'class':'form-control'})
    )
    user_choices = [('student', 'Student'), ('tourist', 'Tourist'), ('business', 'Business')]
    account_type = forms.ChoiceField(widget=forms.RadioSelect, choices=user_choices)
