from django.contrib import admin
from .models import UserProfile, City, Place, State, Category, Department, Industry

class PlaceAdmin(admin.ModelAdmin):
    filter_horizontal = ('department',)

admin.site.register(UserProfile)
admin.site.register(Category)
admin.site.register(City)
admin.site.register(Place, PlaceAdmin)
admin.site.register(State)
admin.site.register(Department)
admin.site.register(Industry)
# Register your models here.
