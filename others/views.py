
from django.http import HttpResponseRedirect, HttpResponse
from django.http import Http404
from django.shortcuts import render, redirect
from .models import Choice, Question, Users
from django.shortcuts import get_object_or_404, render
from django.urls import reverse
from django.views import generic
from django.utils import timezone

from django.contrib.auth import authenticate, login
from django.views.generic import View
from .forms import UserForm

from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.core.urlresolvers import reverse_lazy


class IndexView(generic.ListView):
    template_name = 'polls/index.html'
    context_object_name = 'latest_question_list'

    def get_queryset(self):
        """
        Return the last five published questions (not including those set to be
        published in the future).
        """
        return Question.objects.filter(
            pub_date__lte=timezone.now()
        ).order_by('-pub_date')[:5]


class DetailView(generic.DetailView):
    model = Question
    template_name = 'polls/detail.html'
    #...
    def get_queryset(self):
        """
        Excludes any questions that aren't published yet.
        """
        return Question.objects.filter(pub_date__lte=timezone.now())

class ResultsView(generic.DetailView):
    model = Question
    template_name = 'polls/results.html'

def vote(request, question_id):
    return HttpResponse("You're voting on question %s." % question_id)
		
class UserFormView(View):
	form_class = UserForm
	template_name = 'polls/signup_forms.html'
	
	#display blank form
	def get(self, request):
		form = self.form_class(None)
		return render(request, self.template_name, {'form': form})
	
	#process form data
	def post(self, request):
		form = self.form_class(request.POST)
		
		if form.is_valid():
			user = form.save(commit=False)
			
			#clean data
			username = form.cleaned_data['username']
			first_name = form.cleaned_data['first_name']
			last_name = form.cleaned_data['last_name']
			password = form.cleaned_data['password']
			email = form.cleaned_data['email']
			phone_number = form.cleaned_data['phone_number']
			address = form.cleaned_data['address']
			user.set_password(password)
			account_type = form.cleaned_data['account_type']
			user.save()
			
			#returns user objects if creditentials are valid 
			user = authenticate(username=username, password=password)
			
			if not user:
				raise forms.ValidationError("This user does not exist")
			if not user.check_password(password):
				raise forms.ValidationError("Password incorrect")
			if user is not None:
				if user.is_active:
					login(request, user)
					#when added to welcome page, change template name to welcome page html^
					return render(request, self.template_name, {'form': form})


	