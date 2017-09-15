from django.shortcuts import render
from django.http import HttpResponse
from django.views import View, generic
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
        loginForm = self.login_form_class(None);
        form = SignUpForm(request.POST)
        if form.is_valid():
            return render(request, 'signUpSuccess.html')
        return render(request, 'index.html', {'loginForm': loginForm, 'signUpForm': form})

class Login(View):

    def post(self, request):
        todo = 'todo'


class Search(generic.ListView):
    model = Place
    template_name = 'search.html'
    context_object_name = 'place_list'
    paginate_by = 15
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
