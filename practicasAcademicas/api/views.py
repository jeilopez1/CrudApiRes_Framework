from rest_framework.views import APIView
from .applicartionPractice.createdApplicartion import BuildApplicartion,createAcademicPeriod
from rest_framework.response import Response
from rest_framework import status
from practicasAcademicas.serializers import academicPeriodSerializer

class ApiViewRequest(APIView):
    def get(self,request):
        return Response(BuildApplicartion.CualquierMetodo(), status=status.HTTP_201_CREATED)

    def post(self, request):
        return Response(createAcademicPeriod.MethodCreateAcademicPeriod(self,request), status=status.HTTP_201_CREATED)
