from django.contrib import admin
from .models import User, City, Place, State

admin.site.register(User)
admin.site.register(City)
admin.site.register(Place)
admin.site.register(State)
# Register your models here.
