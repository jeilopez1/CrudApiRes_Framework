from practicasAcademicas.serializers import applicartionSerializer
from .CreatedApplicartion.AddApplicartion import AddApplicartion
from .CreatedApplicartion.AddRequestInvitation import AddRequestInvitation
from .CreatedApplicartion.AddGuestGroup import AddGuestGroup
from .CreatedApplicartion.NotificationInvitates import NotificationInvitatesEMAIL,NotificationInvitatesSMS


class BuildApplicartion():

    def constructApplication(self,request):
        data=applicartionSerializer(data=request.data)
        if data.is_valid():
            idGuestGroup=AddGuestGroup.InsertGuestGroup(self,data)
            AddRequestInvitation.InsertInvitation(self,data,idGuestGroup)
            AddApplicartion.InsertApplicartion(self,data)
            NotificationInvitatesEMAIL(self,data)
            NotificationInvitatesSMS(self,data)

            return "Creado Correctamente y notificado"
        else:
            return data.errors


        
    

