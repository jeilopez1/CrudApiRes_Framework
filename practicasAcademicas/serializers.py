from rest_framework import serializers
from .models import *

class statusSubjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = statusSubject
        fields= '__all__'

class applicartionSerializer(serializers.ModelSerializer):
    class Meta:
        model = applicartion
        fields= ('datetimeStartapplicartion','datetimeFinalapplicartion','routePracticeProject','routeWorkGuide',
                 'typePractice','routeAcceptancedocument','routeContigencyPlan')
        
class academicPeriodSerializer(serializers.ModelSerializer):
    class Meta:
        model = academicPeriod
        fields='__all__'
