from rest_framework import routers
from django.urls import path
from .views import ApiMassMailings

router = routers.SimpleRouter()

urlpatterns = [
    path("Mass-Mailings/", ApiMassMailings.as_view(), name="API2")
    
]

urlpatterns += router.urls


