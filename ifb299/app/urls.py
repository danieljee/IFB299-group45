from django.conf.urls import url
from . import views

app_name = 'app'
urlpatterns = [
    url(r'^$', views.Index.as_view(), name='index'),
    url(r'^signUp$', views.SignUp.as_view(), name='signUp'),
]
