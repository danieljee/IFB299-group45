from django.conf.urls import url
from . import views

# Make sure to prepend app: whenever using reverse url
app_name = 'app'
urlpatterns = [
    url(r'^$', views.index, name='index'),

    url(r'^account/register$', views.register_user, name='register'),
    url(r'^account/register_success$', views.register_success, name='register_success'),
    url(r'^account/auth$', views.auth_view, name='auth'),
    url(r'^account/logout$', views.logout, name='logout'),
    url(r'^account/invalid$', views.invalidLogin, name='invalid'),
    url(r'^account/information$', views.AccountInformation.as_view(), name='account'),
    url(r'^account/edit$', views.EditAccountInformation.as_view(), name='edit_account'),

    url(r'^search/$', views.Search.as_view(), name='search'),
    url(r'^search/(?P<order>)/$', views.search_ordered, name='search_ordered'),
    url(r'^place/(?P<pk>\d+)/$', views.PlaceDetail.as_view(), name='place_detail'),
    
    	url(r'^restaurants/$', views.RestaurantCategory.as_view(), name ='restaurant'),
	url(r'^malls/$', views.MallCategory.as_view(), name ='malls'),
	url(r'^industries/$', views.IndustryCategory.as_view(), name ='industries'),
	url(r'^colleges/$', views.CollegeCategory.as_view(), name ='colleges'),
	url(r'^zoos/$', views.ZooCategory.as_view(), name ='zoos'),
	url(r'^hotels/$', views.HotelCategory.as_view(), name ='hotels'),
	url(r'^museums/$', views.MuseumCategory.as_view(), name ='museums'),
	url(r'^parks/$', views.ParkCategory.as_view(), name ='parks'),
	url(r'^libraries/$', views.LibraryCategory.as_view(), name ='libraries'),
]
