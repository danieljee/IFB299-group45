from django.conf.urls import url
from . import views

app_name = 'app'
urlpatterns = [
    url(r'^$', views.Index.as_view(), name='index'),
    url(r'^signUp/$', views.SignUp.as_view(), name='signUp'),
    url(r'^login/$', views.Login.as_view(), name='login'),
    url(r'^search/$', views.Search.as_view(), name='search'),
    url(r'^place/(?P<pk>\d+)/$', views.PlaceDetail.as_view(), name='place_detail')
]
