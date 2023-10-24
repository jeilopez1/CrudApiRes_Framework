from .services.createAcademicPeriod import createAcademicPeriod
from practicasAcademicas.models import *
from rest_framework.response import Response
from rest_framework import status
from practicasAcademicas.serializers import applicartionSerializer
from .services.FindFK import FindFK



class BuildApplicartion():
    def CualquierMetodo(self,request):

        data=applicartionSerializer(data=request.data)
        
        if data.is_valid():
            FKsApplicartion=FindFK.encontrarFK(self,data)

            VarCualq=applicartion(
                datetimeStartapplicartion = data.validated_data['datetimeStartapplicartion'],
                datetimeFinalapplicartion = data.validated_data['datetimeFinalapplicartion'],
                routePracticeProject =data.validated_data['routePracticeProject'],
                routeWorkGuide = data.validated_data['routeWorkGuide'],
                routeAcceptancedocument =data.validated_data['routeAcceptancedocument'],
                routeContigencyPlan = data.validated_data['routeContigencyPlan'],
                academicPeriod = FKsApplicartion["FKAcademicPeriod"],
                statusApplicartion = FKsApplicartion["FKstatusApplicartion"],
                user = FKsApplicartion["FKuser"],
                processStageHistory = FKsApplicartion["FKprocessStageHistory"],
                typeAcademicPractice = FKsApplicartion["FKtypeAcademicPractice"]
            )
            VarCualq.save()
# 
            return data.data
           
        else:
            return data.errors
    

