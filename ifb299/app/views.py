from django.shortcuts import render_to_response, render
from django.http import HttpResponseRedirect
from django.views import generic
from django.contrib import auth
from django.contrib.auth import authenticate, login
from django.template.context_processors import csrf
from .forms import MyRegistrationForm


from .models import Place

def index(request):
    if request.method == 'GET':
        return render(request, 'index.html')

def register_user(request):
    if request.method == 'POST':
        form = MyRegistrationForm(request.POST)
        if form.is_valid():
            new_user = form.save()
            new_user = auth.authenticate(username=request.POST['username'], password=request.POST['password1'])
            auth.login(request, new_user)
            return HttpResponseRedirect('/account/register_success')
    args = {}
    args.update(csrf(request))
    args['form'] = MyRegistrationForm()
    return render(request, 'register.html', args)


def register_success(request):
    return render(request, 'register_success.html')


def login_view(request):
    c = {}
    c.update(csrf(request))
    return render(request, 'login.html', c)

def auth_view(request):
    username = request.POST.get('username', '')
    password = request.POST.get('password', '')
    user = auth.authenticate(username=username, password=password)
    if user is not None:
        auth.login(request, user)
        return HttpResponseRedirect('/account/loggedIn')
    else:
        return HttpResponseRedirect('/account/invalid')

def loggedIn(request):
    return render(request, 'loggedIn.html', {'username': request.user.username})

def invalid(request):
    return render(request, 'invalidLogin.html')

def logout(request):
    auth.logout(request)
    return render(request, 'logout.html')

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
