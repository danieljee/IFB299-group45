from django.db import models
from django.utils import timezone
from django.core.urlresolvers import reverse
import datetime
from django.contrib.auth.models import UserManager, PermissionsMixin, AbstractBaseUser
from django.utils.translation import ugettext_lazy as _

class MyUserManager(UserManager):
    def create_user(self, email, password):
        now = timezone.now()
        if not email:
            raise ValueError('The Email must be set')
        email = self.normalize_email(email)
        user = self.model(email=email,
                          date_joined=now)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password):
        user = self.create_user(email, password)
        user.is_staff = true
        user.is_superuser = true
        user.save(using=self._db)
        return user

class User(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(unique=True)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)

    first_name = models.CharField(max_length=200)
    last_name = models.CharField(max_length=200)
    phone_number = models.IntegerField()
    address = models.CharField(max_length=200)
    postcode = models.IntegerField()
    CHOICES = (('STUDENT', 'Student'),('BUSINESSMAN', 'Businessman'),('TOURIST', 'Tourist'))
    role = models.CharField(
        max_length=20,
        blank=False,
        default='STUDENT',
        choices=CHOICES,
    )

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['first_name', 'last_name', 'role']
    objects = MyUserManager()
    def __str__(self):
        return self.email

    def get_full_name(self):
        full_name = '%s %s' % (self.first_name, self.last_name)
        return full_name.strip()

    def get_short_name(self):
        return self.first_name
    def has_perms(self, perm, ob=None):
        return True

class State(models.Model):
    name = models.CharField(max_length=200)
    def __str__(self):
        return self.name

class Category(models.Model):
    name = models.CharField(max_length=200)
    def __str__(self):
        return self.name
# To get a list of places in a city, get a city object c and c.place_set.all()
class City(models.Model):
    name = models.CharField(max_length=200)
    #  on_delete=models.CASCADE is the default for ForeignKey
    state = models.ForeignKey(State)
    def __str__(self):
        return self.name

class Place(models.Model):
    name = models.CharField(max_length=200)
    address = models.CharField(max_length=200)
    email = models.EmailField()
    postcode = models.IntegerField()
    city_id = models.ForeignKey(City)
    category_id = models.ForeignKey(Category)
    date = models.DateTimeField('Date Uploaded')

    class Meta:
        ordering = ['date']

    def get_absolute_url(self):
         """
         Returns the url to access a particular instance of MyModelName.
         """
         return reverse('app:place_detail', args=[self.id])

    def __str__(self):
        return self.name
