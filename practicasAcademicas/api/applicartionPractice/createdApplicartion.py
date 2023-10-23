from .services.add_PDF_Service import UpdateFile
from .services.createAcademicPeriod import createAcademicPeriod
from practicasAcademicas.models import applicartion

class BuildApplicartion():
    def CualquierMetodo(self,request):
        PDF=UpdateFile(self,request)
        return "hola Mundo"
    

