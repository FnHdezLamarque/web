from django.views.generic import CreateView
from django.contrib.auth.forms import UserCreationForm

class RegistrationView(CreateView):
    form_class = UserCreationForm
    template_name = 'registration/register.html'
    success_url = '/accounts/login/'