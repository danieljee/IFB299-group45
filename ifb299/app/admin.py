from django.contrib import admin
from .models import UserProfile, City, Place, State, Category

admin.site.register(UserProfile)
admin.site.register(Category)
admin.site.register(City)
admin.site.register(Place)
admin.site.register(State)
# Register your models here.
