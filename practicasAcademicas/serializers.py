from rest_framework import serializers
from .models import *

class PdfSerializer(serializers.Serializer):
    file=serializers.FileField()
    DateTimeStart=serializers.DateTimeField()
    DateTimeFinal=serializers.DateTimeField()

        
class applicartionSerializer(serializers.Serializer):
    datetimeStartapplicartion = serializers.DateTimeField()
    datetimeFinalapplicartion = serializers.DateTimeField()
    routePracticeProject =serializers.FileField()
    routeWorkGuide = serializers.FileField()
    routeAcceptancedocument = serializers.FileField()
    routeContigencyPlan = serializers.FileField()
    academicPeriod = serializers.IntegerField()
    statusApplicartion = serializers.IntegerField()
    user = serializers.IntegerField()
    processStageHistory = serializers.IntegerField()
    typeAcademicPractice = serializers.IntegerField()


class statusSubjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = statusSubject
        fields= '__all__'

        
class academicPeriodSerializer(serializers.ModelSerializer):
    class Meta:
        model = academicPeriod
        fields='__all__'
