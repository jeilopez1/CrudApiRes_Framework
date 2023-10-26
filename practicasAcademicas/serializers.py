from rest_framework import serializers

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
    idSubject=serializers.IntegerField()
    idsExternalGuests = serializers.ListField(child=serializers.IntegerField())


