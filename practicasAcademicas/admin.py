from django.contrib import admin
from django.apps import apps

# Obtén todos los modelos de tu aplicación "PracticasAcademicas"
app_models = apps.get_app_config('practicasAcademicas').get_models()

# Registra todos los modelos en el administrador de Django
for model in app_models:
    admin.site.register(model)
