from rest_framework.views import APIView
from .applicartionPractice.services.createdApplicartion import BuildApplicartion
from .applicartionPractice.services.sendMassMailings import BuildSendMassMailings
from rest_framework.response import Response
from rest_framework import status


class ApiViewRequest(APIView):
    def post(self,request):
        return Response(BuildApplicartion.constructApplication(self,request),status=status.HTTP_201_CREATED)
    
        
class ApiMassMailings(APIView):
    def post(self,request):
        return Response(BuildSendMassMailings.constructSendMassMailings(self,request),status=status.HTTP_201_CREATED)

        pass