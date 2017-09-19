from django.db import models
from django.utils import timezone
from django.core.urlresolvers import reverse
import datetime
from django.contrib.auth.models import UserManager, PermissionsMixin, AbstractBaseUser
from django.utils.translation import ugettext_lazy as _

class MyUserManager(UserManager):
    """
    A custom user manager to deal with emails as unique identifiers for auth
    instead of usernames. The default that's used is "UserManager"
    """
    def _create_user(self, email, password, is_staff, is_superuser,  **extra_fields):
        """
        Creates and saves a User with the given email and password.
        """
        now = timezone.now()
        if not email:
            raise ValueError('The Email must be set')
        email = self.normalize_email(email)
        user = self.model(username=email, email=email,
                          is_staff=is_staff, is_active=True,
                          is_superuser=is_superuser,
                          date_joined=now, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_user(self, email, password=None, **extra_fields):
        return self._create_user(email, password, False, False, **extra_fields)

    def create_superuser(self, email, password, **extra_fields):
        return self._create_user(email, password, True, True, **extra_fields)

class User(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(unique=True)
    is_staff = models.BooleanField(
        _('staff status'),
        default=False,
        help_text=_('Designates whether the user can log into this site.'),
    )
    is_active = models.BooleanField(
        _('active'),
        default=True,
        help_text=_(
            'Designates whether this user should be treated as active. '
            'Unselect this instead of deleting accounts.'
        ),
    )
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
    REQUIRED_FIELDS = ['first_name', 'last_name', 'phone_number', 'address', 'postcode', 'role']
    objects = MyUserManager()

    class Meta:
        verbose_name: _('user')
        verbose_name_plural = _('users')

    def __str__(self):
        return self.email

    def get_full_name(self):
        full_name = '%s %s' % (self.first_name, self.last_name)
        return full_name.strip()

    def get_short_name(self):
        return self.first_name

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
