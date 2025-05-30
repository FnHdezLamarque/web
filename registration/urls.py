from django.urls import path
from registration.views import RegistrationView

urlpatterns = [
    path('register/', RegistrationView.as_view(), name='registration_register'),
]
