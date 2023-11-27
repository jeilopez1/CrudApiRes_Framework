from rest_framework import routers
from django.urls import path
from .views import ApiViewRequest,ApiMassMailings
import smtplib


router = routers.SimpleRouter()
# router = routers.DefaultRouter()

urlpatterns = [
    path("api/", ApiViewRequest.as_view(), name="API"),
    path("Mass_Mailings/", ApiMassMailings.as_view(), name="API")
    
]

# router.register('api/', ApiViewRequest.as_view(), 'applicartion' )
urlpatterns += router.urls


