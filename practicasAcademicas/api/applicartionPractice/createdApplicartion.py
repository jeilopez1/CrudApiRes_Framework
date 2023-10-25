from practicasAcademicas.serializers import applicartionSerializer
from .services.AddApplicartion import AddApplicartion
from .services.AddRequestInvitation import AddRequestInvitation
from .services.AddGuestGroup import AddGuestGroup


class BuildApplicartion():

    def constructApplication(self,request):
        data=applicartionSerializer(data=request.data)
        if data.is_valid():
            idGuestGroup=AddGuestGroup.InsertGuestGroup(self,data)
            AddRequestInvitation.InsertInvitation(self,data,idGuestGroup)
            AddApplicartion.InsertApplicartion(self,data)
            return "Creado Correctamente"
        else:
            return data.errors


        
        
# 
        
    

