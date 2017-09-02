from django.db import models
from django.utils import timezone
import datetime

QLD = 'QLD'
NSW = 'NSW'
SA = 'SA'
TAS = 'TAS'
WA = 'WA'
VIC = 'VIC'
STATES = (
    (QLD, 'QLD'),
    (NSW, 'NSW'),
    (SA, 'SA'),
    (TAS, 'TAS'),
    (WA, 'WA'),
    (VIC, 'VIC')
)

class User(models.Model):
    STUDENT = 'STUDENT'
    BUSINESSMAN = 'BUSINESSMAN'
    TOURIST = 'TOURIST'
    ADMIN = 'ADMIN'
    firstName = models.CharField(max_length=100)
    lastName = models.CharField(max_length=100)
    emailAddress = models.CharField(max_length=100)
    password = models.CharField(max_length=100)
    role = models.CharField(
        max_length=2,
        choices=(
            (STUDENT, 'STUDENT'),
            (BUSINESSMAN, 'BUSINESSMAN'),
            (TOURIST, 'TOURIST'),
            (ADMIN, 'ADMIN')
        )
    )
    date = models.DateTimeField('Date registered')
    def __str__(self):
        return self.emailAddress

class City(models.Model):
    name = models.CharField(max_length=200)
    state = models.CharField(
        max_length=2,
        choices=STATES,
    )
    
class Place(models.Model):
    name = models.CharField(max_length=200)
    address = models.CharField(max_length=200)
    postcode = models.IntegerField()
    state = models.CharField(
        max_length=2,
        choices=STATES,
    )
    city = models.ForeignKey(City, on_delete=models.CASCADE)
    date = models.DateTimeField('Date Uploaded')
    def __str__(self):
        return self.choice_text
