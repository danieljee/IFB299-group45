from django.shortcuts import render
from django.http import HttpResponse
from django.views import View
from .forms import LogInForm, SignUpForm

class Index(View):
    template_name='app/index.html';
    login_form_class = LogInForm
    signUp_form_class = SignUpForm
    def get(self, request):
        loginForm = self.login_form_class(None);
        signUpForm = self.signUp_form_class(None);
        return render(request, self.template_name, {'loginForm': loginForm, 'signUpForm': signUpForm})

class SignUp(View):
    login_form_class = LogInForm
    def post(self, request):
        loginForm = self.login_form_class(None);
        form = SignUpForm(request.POST)
        if form.is_valid():
            return render(request, 'app/signUpSuccess.html')
        return render(request, 'app/index.html', {'loginForm': loginForm, 'signUpForm': form})
