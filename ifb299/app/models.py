from django.db import models
from django.utils import timezone
from django.core.urlresolvers import reverse
import datetime

STATES = (
    ('QLD', 'QLD'),
    ('NSW', 'NSW'),
    ('SA', 'SA'),
    ('TAS', 'TAS'),
    ('WA', 'WA'),
    ('VIC', 'VIC')
)

class User(models.Model):
    firstName = models.CharField(max_length=100)
    lastName = models.CharField(max_length=100)
    emailAddress = models.EmailField()
    password = models.CharField(max_length=100)
    address = models.CharField(max_length=100)
    postcode = models.IntegerField()
    CHOICES = (('STUDENT', 'Student'),('BUSINESSMAN', 'Businessman'),('TOURIST', 'Tourist'))
    role = models.CharField(
        max_length=20,
        blank=False,
        default='STUDENT',
        choices=CHOICES,
    )
    date = models.DateTimeField('Date registered')
    def __str__(self):
        return self.emailAddress

class State(models.Model):
    name = models.CharField(max_length=200)
    def __str__(self):
        return self.name

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
    #  on_delete=models.CASCADE is the default for ForeignKey
    city = models.ForeignKey(City)
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
