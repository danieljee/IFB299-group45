from django.test import TestCase
from django.test import Client
from django.urls import reverse
from app.forms import MyRegistrationForm
from django.contrib.auth.models import User
from .models import Place, UserProfile, City, Category, State, SavedPlace
from django.utils import timezone
import datetime


class FormTest(TestCase):
    def setUp(self):
        user = User.objects.create_user('temporary', 'temporary@gmail.com', 'temporary')

    def test_index(self):
        client = Client()
        response = client.get(reverse('app:index'))
        self.assertTrue(response.status_code == 200)

    # search without being authenticated will return 302
    def test_search(self):
        client = Client()
        response = client.get(reverse('app:search'), {'q': ''})
        self.assertTrue(response.status_code == 302)

    def test_search_authenticated(self):
        client = Client()
        client.login(username='temporary', password='temporary')
        response = client.get(reverse('app:search'), {'q': ''})
        self.assertTrue(response.status_code == 200)

    def test_auth(self):
        client = Client()
        response = client.post(reverse('app:auth'), {'username': 'tempy', 'password': 'temporary'})
        print(response.status_code)
        self.assertTrue(response.status_code == 302)

    def test_auth_authenticated(self):
        client = Client()
        client.login(username='temporary', password='temporary')
        response = client.post(reverse('app:auth'), {'username': 'temporary', 'password': 'temporary'})
        self.assertTrue(response.status_code == 404)

    def test_valid(self):
        form_data = {
             'username': 'IamANewUser',
             'email': 'thisIsAnEmail@gmail.com',
             'first_name': 'firstName',
             'last_name': 'lastName',
             'password': 'abcd1234'
        }
        form = MyRegistrationForm(data = form_data)
        self.assertTrue(form.is_valid())

    def test_invalid_email(self):
        form_data = {
            'username': 'IamANewUser',
            'email': 'thisIsAnEmailgmail.com',
            'first_name': 'firstName',
            'last_name': 'lastName',
            'password': 'abcd1234'
        }
        form = MyRegistrationForm(data = form_data)
        self.assertTrue(not form.is_valid())
<<<<<<< HEAD
=======


>>>>>>> cd8f33b3598ee6f470f9398ae27d42f32d4a005c
    def test_missing_field(self):
        form_data = {
            'email': 'thisIsAnEmailgmail.com',
            'first_name': 'firstName',
            'last_name': 'lastName',
            'password': 'abcd1234'
        }
        form = MyRegistrationForm(data = form_data)
        self.assertTrue(not form.is_valid())
<<<<<<< HEAD
=======

class registerTest(TestCase):
    def setUp(self):
	    user = User.objects.create(username='hello', first_name="firstName", last_name='lastName', email='thisismyemail@email.com', password='password')

	#form should not allow a user to try and create an account using a username already in the database
    def test_same_username(self):
        form_data_2 = {
            'username': 'hello',
            'email': 'thisIsAnEmail@gmail.com',
            'first_name': 'firstName1',
            'last_name': 'lastName1',
            'password': 'abcd1234'
        }
        form = MyRegistrationForm( data = form_data_2)
        self.assertTrue(not form.is_valid())

    def test_missing_password(self):
        form_data = {
		    'username': 'username',
			'email': 'hello@email.com',
			'first_name': 'firstName',
			'last_name': 'lastName'
        }
        form = MyRegistrationForm(data=form_data)
        self.assertTrue(not form.is_valid())

class modelsTest(TestCase):
    def test_no_inputs_displays_no_places_added(self):
        place = {}
        counter = 0
        for all in place:
            counter = counter + 1
        if counter == 0:
            return "no places added yet"
        self.assertTrue(counter == 0)

    def test_state_creation(self):
        state = State.objects.create(name='qld')
        self.assertTrue(isinstance(state, State))
        self.assertEqual(state.__str__(), state.name)

    def test_category_creation(self):
        category = Category.objects.create(name='restaurant')
        self.assertTrue(isinstance(category, Category))
        self.assertEqual(category.__str__(), category.name)

    def test_city_creation(self):
        state1 = State.objects.create(name='qld')
        city = City.objects.create(name='brisbane', state=state1)
        self.assertTrue(isinstance(city, City))
        self.assertEqual(city.__str__(), city.name)

    def test_city_creation(self):
        today = timezone.now()
        state1 = State.objects.create(name='qld')
        city = City.objects.create(name='brisbane', state=state1)
        category = Category.objects.create(name='restaurant')
        place = Place.objects.create(name='KFC', address='1 Queen St', email='KFC@KFC.com', postcode='4000', city_id=city, category_id=category, date=today)
        self.assertTrue(isinstance(place, Place))
        self.assertEqual(place.__str__(), place.name)

    def test_saved_place_creation(self):
        user1 = User.objects.create_user('temporary', 'temporary@gmail.com', 'temporary')
        today = timezone.now()
        state1 = State.objects.create(name='qld')
        city = City.objects.create(name='brisbane', state=state1)
        category = Category.objects.create(name='restaurant')
        place1 = Place.objects.create(name='KFC', address='1 Queen St', email='KFC@KFC.com', postcode='4000', city_id=city, category_id=category, date=today)
        saved_place = SavedPlace.objects.create(user = user1, place = place1)
        self.assertTrue(saved_place.__str__(), saved_place.user.username + saved_place.place.name)

class individualCategoryTest(TestCase):
    def test_displaying_selected_library_category(test):
        today = timezone.now()
        state1 = State.objects.create(name='qld')
        city = City.objects.create(name='brisbane', state=state1)
        category = Category.objects.create(name='restaurant')
        category2 = Category.objects.create(name='library')
        place = Place.objects.create(name='SLQ', address='1 Stanley St', email='SQL@SQL.com', postcode='4000', city_id=city, category_id=category2, date=today)
        place2 = Place.objects.create(name='KFC', address='1 Queen St', email='KFC@KFC.com', postcode='4000', city_id=city, category_id=category, date=today)
        places = { place, place2 }
        for item in places:
            if item.category_id.name == 'library':
                return item.name
        self.assertEqual(place.__str__(), item.name)
		
    def test_displaying_selected_restaurant_category(test):
        today = timezone.now()
        state1 = State.objects.create(name='qld')
        city = City.objects.create(name='brisbane', state=state1)
        category = Category.objects.create(name='restaurant')
        category2 = Category.objects.create(name='library')
        place = Place.objects.create(name='SLQ', address='1 Stanley St', email='SQL@SQL.com', postcode='4000', city_id=city, category_id=category2, date=today)
        place2 = Place.objects.create(name='KFC', address='1 Queen St', email='KFC@KFC.com', postcode='4000', city_id=city, category_id=category, date=today)
        places = { place, place2 }
        for item in places:
            if item.category_id.name == 'restaurant':
                return item.name
        self.assertEqual(place2.__str__(), item.name)

    def test_displaying_selected_museum_category(test):
        today = timezone.now()
        state1 = State.objects.create(name='qld')
        city = City.objects.create(name='brisbane', state=state1)
        category = Category.objects.create(name='museum')
        category2 = Category.objects.create(name='library')
        place = Place.objects.create(name='Science Museum', address='1 Stanley St', email='museum@museum.com', postcode='4000', city_id=city, category_id=category2, date=today)
        place2 = Place.objects.create(name='KFC', address='1 Queen St', email='KFC@KFC.com', postcode='4000', city_id=city, category_id=category, date=today)
        places = { place, place2 }
        for item in places:
            if item.category_id.name == 'museum':
                return item.name
        self.assertEqual(place.__str__(), item.name)
