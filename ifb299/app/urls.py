from django.conf.urls import url
from . import views

# Make sure to prepend app: whenever using reverse url
app_name = 'app'
urlpatterns = [
    url(r'^$', views.index, name='index'),

    url(r'^account/register$', views.register_user, name='register'),
    url(r'^account/auth$', views.auth_view, name='auth'),
    url(r'^account/logout$', views.logout, name='logout'),
    url(r'^account/(?P<pk>\d+)/$', views.account, name='account'),
    url(r'^account/places$', views.saved_places, name='saved_places'),
    url(r'^account/places/(?P<pk>\d+)$', views.saved_places, name='saved_places'),

    url(r'^search/$', views.Search.as_view(), name='search'),
    url(r'^search/(?P<order>\w+)/$', views.search_ordered, name='search_ordered'),
    url(r'^place/(?P<pk>\d+)/$', views.PlaceDetail.as_view(), name='place_detail'),
    url(r'place/(?P<pk>\d+)/reviews$', views.reviews, name='reviews'),
    url(r'^contact/$', views.contact, name='contact'),

    url(r'^categories/(?P<category>\w+)/$', views.Category.as_view(), name ='category_specific'),
    url(r'^categories/$', views.AllCategories.as_view(), name ='categories'),
]
