from practicasAcademicas.models import applicartion
from .FindFK import FindFK

class AddApplicartion():

    def InsertApplicartion(self,data):
        
            
            FKsApplicartion=FindFK.encontrarFK(self,data)

            ObjApplicartion=applicartion(
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
            ObjApplicartion.save()
            return True
           