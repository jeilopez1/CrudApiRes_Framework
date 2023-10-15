from rest_framework import routers
from django.urls import path
from .views import ApiViewRequest


router = routers.SimpleRouter()
# router = routers.DefaultRouter()

urlpatterns = [
    path("api/", ApiViewRequest.as_view(), name="API")
    
]

# router.register('api/', ApiViewRequest.as_view(), 'applicartion' )
urlpatterns += router.urls


