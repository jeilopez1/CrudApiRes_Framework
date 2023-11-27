from .CreatedApplicartion.NotificationInvitates import NotificationInvitatesEMAIL

class BuildSendMassMailings():

    def constructSendMassMailings(self,request):
        emails=[]
        NotificationInvitatesEMAIL.notificationRequestInvitactionEMAIL(self,emails)
        return "Creado Correctamente y notificado"
        

        
    

