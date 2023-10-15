from rest_framework.views import APIView
from .applicartionPractice.applicartion import BuildRequest,createAcademicPeriod
from rest_framework.response import Response
from rest_framework import status
from practicasAcademicas.serializers import academicPeriodSerializer

class ApiViewRequest(APIView):
    def get(self,request):
        return Response(BuildRequest.CualquierMetodo(), status=status.HTTP_201_CREATED)

    def post(self, request):
        return Response(createAcademicPeriod.MethodCreateAcademicPeriod(self,request), status=status.HTTP_201_CREATED)
