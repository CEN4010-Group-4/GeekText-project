from django.apps import AppConfig


class FirstAppConfig(AppConfig):
    name = 'users'

    def ready(self):
    import users.signals
