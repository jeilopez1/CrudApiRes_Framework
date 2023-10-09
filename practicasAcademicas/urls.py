from rest_framework import routers
from .api import *
router = routers.DefaultRouter()
router.register('api/practicasAcademicas/applicartion', applicartionViewSet, 'applicartion' )
router.register('api/practicasAcademicas/statusSubject', statusSubjectViewSet, 'statusSubject' )
urlpatterns = router.urls