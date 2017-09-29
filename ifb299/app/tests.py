from django.test import TestCase
from django.test import Client
from django.urls import reverse
from app.forms import MyRegistrationForm
from django.contrib.auth.models import User

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
