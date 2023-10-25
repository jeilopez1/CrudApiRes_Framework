from rest_framework.views import APIView
from .applicartionPractice.createdApplicartion import BuildApplicartion
from rest_framework.response import Response
from rest_framework import status
from practicasAcademicas.serializers import PdfSerializer


class ApiViewRequest(APIView):
    def post(self,request):
        return Response(BuildApplicartion.constructApplication(self,request),status=status.HTTP_201_CREATED)
    
        
      

    # def post(self, request):
    #     return Response(createAcademicPeriod.MethodCreateAcademicPeriod(self,request), status=status.HTTP_201_CREATED)
