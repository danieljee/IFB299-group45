from django.shortcuts import render_to_response, render
from django.http import HttpResponseRedirect, HttpResponse
from django.views import generic
from django.contrib import auth
from django.contrib.auth.models import User
from .models import UserProfile, Place
from django.contrib.auth import authenticate, login
from django.template.context_processors import csrf
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from .forms import MyRegistrationForm, UserProfileForm
from .models import Place, UserProfile

class HttpResponseUnauthorized(HttpResponseRedirect):
    status_code = 401

class HttpResponseNotFound(HttpResponseRedirect):
    status_code = 404

#def index(request):
#    if request.method == 'GET':
#        args = {}
#        args.update(csrf(request))
#        args['user_form'] = MyRegistrationForm()
#        args['profile_form'] = UserProfileForm()
#        return render(request, 'index.html', args)

def index(request):
	if request.method == 'GET':
		args = {}
		args.update(csrf(request))
		args['user_form'] = MyRegistrationForm()
		args['profile_form'] = UserProfileForm()
		if request.user.is_authenticated() and not request.user.is_superuser:
			profile = UserProfile.objects.filter(user=request.user).first()
			args['role'] = profile.role
		return render(request, 'index.html', args)

class AllCategories(generic.ListView):
    model = Place
    template_name = 'allCategories.html'
    context_object_name = 'place_list'

def restaurants(request):
	return render(request, 'restaurants.html')

def malls(request):
	return HttpResponseRedirect('malls')

def zoos(request):
	return HttpResponseRedirect('zoos')

def parks(request):
	return render(request, 'parks.html')

def libraries(request):
	return render(request, 'libraries.html')

def colleges(request):
	return render(request, 'colleges.html')

def industries(request):
	return render(request, 'industries.html')

def hotels(request):
	return render(request, 'hotels.html')

def museums(request):
	return render(request, 'museums.html')

def register_user(request):
    if request.method == 'POST':
        user_form = MyRegistrationForm(data = request.POST)
        profile_form = UserProfileForm(data = request.POST)
        print('i received request')
        if user_form.is_valid() and profile_form.is_valid():
            print('form was valid');
            new_user = user_form.save()
            new_user.set_password(new_user.password)
            new_user.save()
            profile = profile_form.save(commit = False)
            profile.user = new_user
            profile.save()
            return HttpResponseRedirect('/account/register_success')
    args = {}
    args.update(csrf(request))
    args['user_form'] = user_form
    args['profile_form'] = profile_form
    return render(request, 'index.html', args)


def register_success(request):
    if request.user.is_authenticated():
        return HttpResponseNotFound('/')
    return render(request, 'register_success.html')


def auth_view(request):
    if request.user.is_authenticated():
        return HttpResponseNotFound('/')
    username = request.POST.get('username', '')
    password = request.POST.get('password', '')
    user = auth.authenticate(username=username, password=password)
    if user is not None:
        auth.login(request, user)
        return HttpResponseRedirect('/')
    else:
        return HttpResponseRedirect('/account/invalid')

def invalidLogin(request):
    if request.user.is_authenticated():
        return HttpResponseNotFound('/')
    return render(request, 'invalidLogin.html')

def logout(request):
    if not request.user.is_authenticated():
        return HttpResponseNotFound('/')
    auth.logout(request)
    return render(request, 'logout.html')

def search_ordered(request):
    if request.method == 'GET':
        query = request.GET.get('q')
        # places = Place.objects.filter(name_icontains=query).order_by()

class Search(generic.ListView):
    model = Place
    template_name = 'search.html'
    context_object_name = 'place_list'
    paginate_by = 10

    @method_decorator(login_required)
    def dispatch(self, *args, **kwargs):
        return super(Search, self).dispatch(*args, **kwargs)

    def get_queryset(self):
        self.query = self.request.GET.get('q')
        return Place.objects.filter(name__icontains=self.query)
    def get_context_data(self, **kwargs):
        ctx = super(Search, self).get_context_data(**kwargs)
        ctx['pagination'] = self.paginate_by
        ctx['count'] = self.get_queryset().count()
        return ctx

class PlaceDetail(generic.DetailView):
    model = Place
    template_name = 'placeDetail.html'
    context_object_name = 'place'

class AccountInformation(generic.ListView):
    model = UserProfile
    template_name = 'AccountInformation.html'
    context_object_name = 'users'
    def get_queryset(self):
        return UserProfile.objects.filter(user=self.request.user)

def edit_profile(request):
    args = {}
    user = request.user
    form = UpdateUserForm(request.POST, instance=request.user)
    if request.method == 'POST':
        if form.is_valid():
            user.first_name = request.POST['first_name']
            user.last_name = request.POST['last_name']
            user.email = request.POST['email']
            user.userprofile.phone_number = request.POST['phone_number']
            user.userprofile.address = request.POST['address']
            user.userprofile.postcode = request.POST['postcode']
            user.userprofile.role = request.POST['role']
            user.save()
            user.userprofile.save()
            return HttpResponseRedirect('information')
    return render(request, 'EditAccount.html')

class RestaurantCategory(generic.ListView):
	model = Place
	template_name = 'restaurants.html'
	context_object_name = 'place_list'

class IndustryCategory(generic.ListView):
	model = Place
	template_name = 'industries.html'
	context_object_name = 'place_list'

class MallCategory(generic.ListView):
	model = Place
	template_name = 'malls.html'
	context_object_name = 'place_list'

class LibraryCategory(generic.ListView):
	model = Place
	template_name = 'libraries.html'
	context_object_name = 'place_list'

class ZooCategory(generic.ListView):
	model = Place
	template_name = 'zoos.html'
	context_object_name = 'place_list'

class CollegeCategory(generic.ListView):
	model = Place
	template_name = 'colleges.html'
	context_object_name = 'place_list'

class MuseumCategory(generic.ListView):
	model = Place
	template_name = 'museums.html'
	context_object_name = 'place_list'

class HotelCategory(generic.ListView):
	model = Place
	template_name = 'hotels.html'
	context_object_name = 'place_list'

class ParkCategory(generic.ListView):
	model = Place
	template_name = 'parks.html'
	context_object_name = 'place_list'

class SavedPlaces(generic.ListView):
    model = Place
    template_name = 'saved_places.html'
    context_object_name = 'savedPlace'
