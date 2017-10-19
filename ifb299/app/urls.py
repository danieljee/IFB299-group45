from django.conf.urls import url
from . import views

# Make sure to prepend app: whenever using reverse url
app_name = 'app'
urlpatterns = [
    url(r'^$', views.index, name='index'),

    url(r'^account/register$', views.register_user, name='register'),
    url(r'^account/auth$', views.auth_view, name='auth'),
    url(r'^account/logout$', views.logout, name='logout'),
    url(r'^account/information$', views.AccountInformation.as_view(), name='account'),
    url(r'^account/edit$', views.edit_profile, name='edit_account'),
    url(r'^account/delete$', views.delete_profile, name='delete_profile'),
    url(r'^account/saved_places$', views.SavedPlaces.as_view(), name='saved_places'),
    url(r'^account/add_place$', views.add_place, name='add_place'),
    url(r'^account/remove_place$', views.remove_place, name='remove_place'),
    url(r'^search/$', views.Search.as_view(), name='search'),
    url(r'^search/(?P<order>\w+)/$', views.search_ordered, name='search_ordered'),
    url(r'^place/(?P<pk>\d+)/$', views.PlaceDetail.as_view(), name='place_detail'),
    url(r'place/(?P<pk>\d+)/reviews$', views.get_review_list, name='get_review_list'),

    url(r'place/(?P<pk>\d+)/review$', views.handle_review, name='handle_review'),
    url(r'^contact/$', views.contact, name='contact'),

    url(r'^category/(?P<category>\w+)/$', views.Category.as_view(), name ='category'),
    url(r'^allCategories/$', views.AllCategories.as_view(), name ='allCategories'),
]
