from django.test import TestCase
from django.test import Client
from django.urls import reverse
from app.forms import MyRegistrationForm, UpdateUserForm
from django.contrib.auth.models import User
from .models import Place, UserProfile, City, Category, State, SavedPlace, Industry, Department
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
    def test_missing_field(self):
        form_data = {
            'email': 'thisIsAnEmailgmail.com',
            'first_name': 'firstName',
            'last_name': 'lastName',
            'password': 'abcd1234'
        }
        form = MyRegistrationForm(data = form_data)
        self.assertTrue(not form.is_valid())

class IndexTests(TestCase):
    def test_index_loggedIn_STUDENT(self):
        user = User.objects.create_user('testUsername', 'temporary@gmail.com', 'TestPassword')
        UserProfile.objects.create(user_id = user.id)
        user.first_name = 'test'
        user.last_name = 'case'
        user.phone_number = '3673920'
        user.address = '34 Some Rd'
        user.postcode = '4000'
        user.role = 'STUDENT'
        client = Client()
        client.login(username='testUsername', password='TestPassword')
        response = client.get(reverse('app:index'))
        self.assertTrue(response.status_code == 200)

    def test_index_loggedIn_BUSINESSMAN(self):
        user = User.objects.create_user('testUsername', 'temporary@gmail.com', 'TestPassword')
        user = UserProfile.objects.create(user_id = user.id)
        user.first_name = 'test'
        user.last_name = 'case'
        user.phone_number = '3673920'
        user.address = '34 Some Rd'
        user.postcode = '4000'
        user.role = 'BUSINESSMAN'
        client = Client()
        client.login(username='testUsername', password='TestPassword')
        response = client.get(reverse('app:index'))
        self.assertTrue(user.role, 'BUSINESSMAN')
        self.assertTrue(response.status_code == 200)

    def test_index_loggedIn_TOURIST(self):
        user = User.objects.create_user('testUsername', 'temporary@gmail.com', 'TestPassword')
        user = UserProfile.objects.create(user_id = user.id)
        user.first_name = 'test'
        user.last_name = 'case'
        user.phone_number = '3673920'
        user.address = '34 Some Rd'
        user.postcode = '4000'
        user.role = 'TOURIST'
        client = Client()
        client.login(username='testUsername', password='TestPassword')
        response = client.get(reverse('app:index'))
        self.assertTrue(user.role, 'TOURIST')
        self.assertTrue(response.status_code == 200)

    def test_index_loggedIn_Superuser(self):
        user1 = User.objects.create_superuser('testUsername', 'temporary@gmail.com', 'TestPassword')
        user = UserProfile.objects.create(user_id = user1.id)
        user.first_name = 'test'
        user.last_name = 'case'
        user.phone_number = '3673920'
        user.address = '34 Some Rd'
        user.postcode = '4000'
        user.role = 'BUSINESSMAN'
        client = Client()
        client.login(username='testUsername', password='TestPassword')
        response = client.get(reverse('app:index'))
        self.assertTrue(user.role, 'BUSINESSMAN')
        self.assertTrue(user1.is_superuser)
        self.assertTrue(response.status_code == 200)

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

    def test_displaying_selected_college_category(test):
        today = timezone.now()
        state1 = State.objects.create(name='qld')
        city = City.objects.create(name='brisbane', state=state1)
        category = Category.objects.create(name='college')
        department1 = Department.objects.create(name = 'science')
        department2 = Department.objects.create(name = 'engineering')
        place = Place.objects.create(name='QUT', address='2 George st', email='qut@learning.com', postcode='4000', city_id=city, category_id=category, date=today)
        place.department = (department1,department2)
        places = {place}
        for item in places:
            if item.category_id.name == 'college':
                return item.name
        self.assertEqual(place.__str__(), item.name)

    def test_displaying_selected_zoo_category(test):
        today = timezone.now()
        state1 = State.objects.create(name='qld')
        city = City.objects.create(name='brisbane', state=state1)
        category = Category.objects.create(name='zoo')
        place = Place.objects.create(name='Australia Zoo', address='1 Queen St', email='zoo@cocs.com', postcode='4000', city_id=city, category_id=category, date=today)
        places = {place}
        for item in places:
            if item.category_id.name == 'zoo':
                return item.name
        self.assertEqual(place.__str__(), item.name)

    def test_displaying_selected_hotel_category(test):
        today = timezone.now()
        state1 = State.objects.create(name='qld')
        city = City.objects.create(name='brisbane', state=state1)
        category = Category.objects.create(name='hotel')
        place = Place.objects.create(name='Grand Budapest Hotel', address='1 Queen St', email='hotel@sleep.com', postcode='4000', city_id=city, category_id=category, date=today)
        places = {place}
        for item in places:
            if item.category_id.name == 'hotel':
                return item.name
        self.assertEqual(place.__str__(), item.name)

    def test_displaying_selected_mall_category(test):
        today = timezone.now()
        state1 = State.objects.create(name='qld')
        city = City.objects.create(name='brisbane', state=state1)
        category = Category.objects.create(name='mall')
        place = Place.objects.create(name='Queen St Mall', address='1 Queen St', email='mall@OMGLetsGoShopping.com', postcode='4000', city_id=city, category_id=category, date=today)
        places = {place}
        for item in places:
            if item.category_id.name == 'mall':
                return item.name
        self.assertEqual(place.__str__(), item.name)

    def test_displaying_selected_industry_category(test):
        today = timezone.now()
        state1 = State.objects.create(name='qld')
        city = City.objects.create(name='brisbane', state=state1)
        category = Category.objects.create(name='industry')
        industry1 = Industry.objects.create(name = 'manufacturing')
        place = Place.objects.create(name='KFC', address='1 Queen St', email='KFC@KFC.com', postcode='4000', city_id=city, category_id=category, industry=industry1, date=today)
        places = {place}
        for item in places:
            if item.category_id.name == 'industry':
                return item.name
        self.assertEqual(place.__str__(), item.name)

    def test_displaying_selected_park_category(test):
        today = timezone.now()
        state1 = State.objects.create(name='qld')
        city = City.objects.create(name='brisbane', state=state1)
        category = Category.objects.create(name='park')
        place = Place.objects.create(name='KFC', address='1 Queen St', email='KFC@KFC.com', postcode='4000', city_id=city, category_id=category, date=today)
        places = {place}
        for item in places:
            if item.category_id.name == 'park':
                return item.name
        self.assertEqual(place.__str__(), item.name)

    def test_displaying_selected_empty_category(self):
        today = timezone.now()
        state1 = State.objects.create(name='qld')
        city = City.objects.create(name='brisbane', state=state1)
        category = Category.objects.create(name='restaurant')
        category2 = Category.objects.create(name='college')
        place = Place.objects.create(name='KFC', address='1 Queen St', email='KFC@KFC.com', postcode='4000', city_id=city, category_id=category, date=today)
        places = {place}
        count = 0
        for item in places:
            if item.category_id.name == 'college':
                count = count + 1
        self.assertEqual(count, 0)

class SearchTest(TestCase):
    def test_search_result(self):
        today = timezone.now()
        state1 = State.objects.create(name='qld')
        city = City.objects.create(name='brisbane', state=state1)
        category = Category.objects.create(name='college')
        department1 = Department.objects.create(name = 'science')
        department2 = Department.objects.create(name = 'engineering')
        place = Place.objects.create(name='QUT', address='2 George st', email='qut@learning.com', postcode='4000', city_id=city, category_id=category, date=today)
        place.department = (department1,department2)
        places = {place}
        for item in places:
            if item.name == 'qut':
                return item.name
        self.assertEqual(place.__str__(), item.name)

    def test_multiple_search_results(self):
        today = timezone.now()
        state1 = State.objects.create(name='qld')
        city = City.objects.create(name='brisbane', state=state1)
        category = Category.objects.create(name='college')
        department1 = Department.objects.create(name = 'science')
        department2 = Department.objects.create(name = 'engineering')
        place = Place.objects.create(name='QUT', address='2 George st', email='qut@learning.com', postcode='4000', city_id=city, category_id=category, date=today)
        place2 = Place.objects.create(name='QUT Library', address='2 George st', email='qut@learning.com', postcode='4000', city_id=city, category_id=category, date=today)
        place.department = (department1,department2)
        places = {place,place2}
        count = 0
        for item in places:
            if 'QUT' in item.name:
                count = count + 1
        self.assertEqual(count, 2)

    def test_filtered_search_result(self):
        today = timezone.now()
        state1 = State.objects.create(name='qld')
        city = City.objects.create(name='brisbane', state=state1)
        category = Category.objects.create(name='college')
        department1 = Department.objects.create(name = 'science')
        department2 = Department.objects.create(name = 'engineering')
        place = Place.objects.create(name='QUT', address='2 George st', email='qut@learning.com', postcode='4000', city_id=city, category_id=category, date=today)
        place2 = Place.objects.create(name='QUT Library', address='2 George st', email='qut@learning.com', postcode='4000', city_id=city, category_id=category, date=today)
        place.department = (department1,department2)
        places = {place,place2}
        count = 0
        for item in places:
            if 'Library' in item.name:
                count = count + 1
        self.assertEqual(count, 1)

    def test_empty_search_result(self):
        today = timezone.now()
        state1 = State.objects.create(name='qld')
        city = City.objects.create(name='brisbane', state=state1)
        category = Category.objects.create(name='college')
        department1 = Department.objects.create(name = 'science')
        department2 = Department.objects.create(name = 'engineering')
        place = Place.objects.create(name='QUT', address='2 George st', email='qut@learning.com', postcode='4000', city_id=city, category_id=category, date=today)
        place.department = (department1,department2)
        places = {place}
        count = 0
        for item in places:
            if item.name == 'school':
                count = count + 1
        self.assertEqual(count, 0)

class EditUserTest(TestCase):
    def setUp(self):
        user = User.objects.create_user('temporary', 'temporary@gmail.com', 'temporary')

    def test_account(self):
        client = Client()
        client.login(username='temporary', password='temporary')
        response = client.get(reverse('app:account'))
        self.assertTrue(response.status_code == 200)

	#tests user trying to reach account info page without being logged in will return TypeError
    def test_account(self):
        client = Client()
        #response = client.get(reverse('app:account'))
        self.assertRaises(TypeError, client.get,reverse('app:account'))

    #tests valid form
    def test_valid_edit_user_form(self):
        form_data = {
             'first_name': 'firstName',
             'last_name': 'lastName',
             'email': 'thisIsAnEmail@gmail.com',
             'phone_number': '084758393',
             'address': '63 Some Rd',
             'postcode': '0504',
             'role': 'STUDENT'
        }
        form = UpdateUserForm(data = form_data)
        self.assertTrue(form.is_valid())

    #tests invalid first name
    def test_invalid_edit_user_first_name(self):
        form_data = {
             'first_name': '-000000000000000000000000000000000000000',
             'last_name': 'lastName',
             'email': 'thisIsAnEmail@gmail.com',
             'phone_number': '084758393',
             'address': '63 Some Rd',
             'postcode': '0504',
             'role': 'STUDENT'
        }
        form = UpdateUserForm(data = form_data)
        self.assertFalse(form.is_valid())
		
    #tests invalid last name
    def test_invalid_edit_user_last_name(self):
        form_data = {
             'first_name': 'firstName',
             'last_name': 'A random long sentance to show the character limit',
             'email': 'thisIsAnEmail@gmail.com',
             'phone_number': '084758393',
             'address': '63 Some Rd',
             'postcode': '0504',
             'role': 'STUDENT'
        }
        form = UpdateUserForm(data = form_data)
        self.assertFalse(form.is_valid())

    #tests no role email
    def test_invalid_edit_user_email(self):
        form_data = {
             'first_name': 'firstName',
             'last_name': 'lastName',
             'email': 'thisIsNOTAnEmail.com',
             'phone_number': '084758393',
             'address': '63 Some Rd',
             'postcode': '0504',
             'role': 'STUDENT'
        }
        form = UpdateUserForm(data = form_data)
        self.assertFalse(form.is_valid())

    #tests no role phone number
    def test_invalid_edit_user_phone(self):
        form_data = {
             'first_name': 'firstName',
             'last_name': 'lastName',
             'email': 'thisIsAnEmail@gmail.com',
             'phone_number': '080004758393',
             'address': '63 Some Rd',
             'postcode': '0504',
             'role': 'STUDENT'
        }
        form = UpdateUserForm(data = form_data)
        self.assertFalse(form.is_valid())

    #tests invlaid postcode
    def test_invalid_edit_user_postcode(self):
        form_data = {
             'first_name': 'firstName',
             'last_name': 'lastName',
             'email': 'thisIsAnEmail@gmail.com',
             'phone_number': '084758393',
             'address': '63 Some Rd',
             'postcode': '0s504',
             'role': 'STUDENT'
        }
        form = UpdateUserForm(data = form_data)
        self.assertFalse(form.is_valid())

    #tests no role input
    def test_invalid_edit_user_role(self):
        form_data = {
             'first_name': 'firstName',
             'last_name': 'lastName',
             'email': 'thisIsAnEmail@gmail.com',
             'phone_number': '084758393',
             'address': '63 Some Rd',
             'postcode': '0504',
             'role': ''
        }
        form = UpdateUserForm(data = form_data)
        self.assertFalse(form.is_valid())

    #optional info (phone_number and address fields can be left blank)
    def test_valid_edit_user_without_optional(self):
        form_data = {
             'first_name': 'firstName',
             'last_name': 'lastName',
             'email': 'thisIsAnEmail@gmail.com',
             'phone_number': '',
             'address': '',
             'postcode': '4000',
             'role': 'STUDENT'
        }
        form = UpdateUserForm(data = form_data)
        self.assertTrue(form.is_valid())
