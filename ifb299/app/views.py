from django.shortcuts import render
from django.http import HttpResponse
from django.views import View, generic
from django.contrib import messages
from django.contrib.auth import authenticate, login
from django.template.context_processors import csrf
from .forms import LogInForm, SignUpForm

from .models import Place

class Index(View):
    template_name='index.html';
    login_form_class = LogInForm
    signUp_form_class = SignUpForm
    def get(self, request):
        loginForm = self.login_form_class(None);
        signUpForm = self.signUp_form_class(None);
        return render(request, self.template_name, {'loginForm': loginForm, 'signUpForm': signUpForm})

class SignUp(View):
    login_form_class = LogInForm
    def post(self, request):
        if request.user.is_authenticated():
            return HttpResponseRedirect('/')
        else :
            loginForm = self.login_form_class(None);
            form = SignUpForm(request.POST)
            if form.is_valid():
                form.save()
                user = authenticate(email=request.POST.get('email'), password=request.POST.get('password'))
                print('email submitted: '+request.POST.get('email'))
                print('password submitted: ' + request.POST.get('password'))
                print(user)
                if user:
                    messages.success(request, "Successfully Registered")
                    return render(request, 'signUpSuccess.html')
                else:
                    messages.error(request, "Unable to log you in at this time!")
                    args = {'loginForm': loginForm, 'signUpForm':form, 'error': 'Sign up error: cannot log in'}
                    args.update(csrf(request))
                    return render(request, 'index.html', args)

class Login(View):
    def post(self, request):
        form = LogInForm(request.POST)
        if form.is_valid():
            user = auth.authenticate(email=request.POST.get('email'),
                                    password=request.POST.get('password'))

        # user = authenticate(username=username, password=password)
            if user is not None:
                login(request, user)
                return HttpResponseRedirect('/')
            else:
                return HttpResponseRedirect('/')


class Search(generic.ListView):
    model = Place
    template_name = 'search.html'
    context_object_name = 'place_list'
    paginate_by = 10
    def get_queryset(self):
        self.query = self.request.GET.get('q')
        return Place.objects.filter(name__icontains=self.query)
        # queryParamter = request.GET.get('q', None) get the query parameter
        # and do results = Places.objects.filter(name__contains=queryParamter) to obtain the list of results
        # if (results.count() == 0)
    def get_context_data(self, **kwargs):
        context = super(Search, self).get_context_data(**kwargs)
        context['query'] = self.query
        return context

class PlaceDetail(generic.DetailView):
    model = Place
    template_name = 'placeDetail.html'
    context_object_name = 'place'
