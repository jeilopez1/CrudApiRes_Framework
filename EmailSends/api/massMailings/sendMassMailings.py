from .services.sendMail import SendMail
from EmailSends.serializers import CorreoCSVSerializer

class BuildSendMassMailings():

    def constructSendMassMailings(self,request):
        data=CorreoCSVSerializer(data=request.data)
        if data.is_valid():
            emails=[]
            SendMail.SendEMAIL(self,data)
            return "Creado Correctamente y notificado"
        else:
            return data.errors
        

        
    

