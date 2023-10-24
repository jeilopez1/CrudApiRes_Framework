from practicasAcademicas.models import academicPeriod,typeAcademicPractice,statusApplicartion,user,processStageHistory

class FindFK():
    def encontrarFK(self,data):


        FKAcademicPeriod = academicPeriod.objects.get(id=data["academicPeriod"].value)
        FKtypeAcademicPractice = typeAcademicPractice.objects.get(id=data["typeAcademicPractice"].value)
        FKstatusApplicartion = statusApplicartion.objects.get(id=data["statusApplicartion"].value)
        FKprocessStageHistory = processStageHistory.objects.get(id=data["processStageHistory"].value)
        FKuser = user.objects.get(id=data["user"].value)

        datajson={
            "FKAcademicPeriod":FKAcademicPeriod,
            "FKtypeAcademicPractice":FKtypeAcademicPractice,
            "FKstatusApplicartion":FKstatusApplicartion,
            "FKprocessStageHistory":FKprocessStageHistory,
            "FKuser":FKuser
        }

        return datajson