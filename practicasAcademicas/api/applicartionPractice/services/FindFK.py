from practicasAcademicas.models import academicPeriod,typeAcademicPractice,statusApplicartion,user,processStageHistory,subject

class FindFK():
    def encontrarFK(self,data):
        FKAcademicPeriod = academicPeriod.objects.get(id=data["academicPeriod"].value)
        FKtypeAcademicPractice = typeAcademicPractice.objects.get(id=data["typeAcademicPractice"].value)
        FKstatusApplicartion = statusApplicartion.objects.get(id=data["statusApplicartion"].value)
        FKprocessStageHistory = processStageHistory.objects.get(id=data["processStageHistory"].value)
        FKuser = user.objects.get(id=data["user"].value)
        FKSubject = subject.objects.get(id=data["idSubject"].value)
        idsExternalGuests=[]
        for x in data["idsExternalGuests"].value:
            idsExternalGuests.append(user.objects.get(id=x))

        datajson={
            "FKAcademicPeriod":FKAcademicPeriod,
            "FKtypeAcademicPractice":FKtypeAcademicPractice,
            "FKstatusApplicartion":FKstatusApplicartion,
            "FKprocessStageHistory":FKprocessStageHistory,
            "FKuser":FKuser,
            "FKSubject":FKSubject,
            "FKSExternalGuests":idsExternalGuests
        }

        return datajson