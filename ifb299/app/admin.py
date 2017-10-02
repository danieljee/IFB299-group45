from django.contrib import admin
from .models import UserProfile, City, Place, State, Category, Department, Industry

admin.site.register(UserProfile)
admin.site.register(Category)
admin.site.register(City)
admin.site.register(Place)
admin.site.register(State)
admin.site.register(Department)
admin.site.register(Industry)
# Register your models here.
