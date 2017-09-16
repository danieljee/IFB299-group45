from .models import User


class CustomUserAuth(object):

    def authenticate(self, email=None, password=None):
        try:
            user = User.objects.get(email=email)
            print('inside authenticate mehtod')
            print(User.objects.get(email=email))
            print(user)
            if user.check_password(password):
                return user
        except User.DoesNotExist:
            return None

    def get_user(self, user_id):
        try:
            user = User.objects.get(pk=user_id)
            if user.is_active:
                return user
            return None
        except User.DoesNotExist:
            return None
