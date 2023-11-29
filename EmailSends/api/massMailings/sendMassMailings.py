from .services.sendMail import SendMail
from EmailSends.serializers import CorreoCSVSerializer

class BuildSendMassMailings():

    def constructSendMassMailings(self,request):
        data = CorreoCSVSerializer(data=request.data)
        if data.is_valid():
            SendMail.SendEMAIL(self,data)
            return "Creado Correctamente y notificado"
        else:
            errores = data.errors  # Si los datos no son válidos, puedes manejar los errores aquí


        
    

