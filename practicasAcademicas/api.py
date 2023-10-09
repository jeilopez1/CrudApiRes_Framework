from .models import *
from rest_framework import viewsets, permissions
from .serializers import *

class applicartionViewSet(viewsets.ModelViewSet):
    queryset = applicartion.objects.all()
    permission_classes = [permissions.AllowAny]
    serializer_class = applicartionSerializer

class statusSubjectViewSet(viewsets.ModelViewSet):
    queryset = statusSubject.objects.all()
    permission_classes = [permissions.AllowAny]
    serializer_class = statusSubjectSerializer