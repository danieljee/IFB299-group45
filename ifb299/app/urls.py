from django.conf.urls import url
from . import views

# Make sure to prepend app: whenever using reverse url
app_name = 'app'
urlpatterns = [
    url(r'^$', views.index, name='index'),

    url(r'^account/register$', views.register_user, name='register'),
    url(r'^account/register_success$', views.register_success, name='register_success'),
    url(r'^account/auth$', views.auth_view, name='auth'),
    url(r'^account/loggedIn$', views.loggedIn, name='loggedIn'),
    url(r'^account/logout$', views.logout, name='logout'),
    url(r'^account/invalid$', views.invalidLogin, name='invalid'),
    url(r'^account/information$', views.AccountInformation.as_view(), name='account'),
    url(r'^account/edit$', views.EditAccountInformation.as_view(), name='edit_account'),

    url(r'^search/$', views.Search.as_view(), name='search'),
    url(r'^search/(?P<order>)/$', views.search_ordered, name='search_ordered'),
    url(r'^place/(?P<pk>\d+)/$', views.PlaceDetail.as_view(), name='place_detail')
]
