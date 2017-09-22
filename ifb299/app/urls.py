from django.conf.urls import url
from . import views

# Make sure to prepend app: whenever using reverse url
app_name = 'app'
urlpatterns = [
    url(r'^$', views.index, name='index'),

    url(r'^account/register$', views.register_user, name='register'),
    url(r'^account/register_success$', views.register_success, name='register_success'),
    url(r'^account/login$', views.login_view, name='login'),
    url(r'^account/auth$', views.auth_view, name='auth'),
    url(r'^account/loggedIn$', views.loggedIn, name='loggedIn'),
    url(r'^account/logout$', views.logout, name='logout'),
    url(r'^account/invalid$', views.invalid, name='invalid'),

    url(r'^search/$', views.Search.as_view(), name='search'),
    url(r'^place/(?P<pk>\d+)/$', views.PlaceDetail.as_view(), name='place_detail')
]
