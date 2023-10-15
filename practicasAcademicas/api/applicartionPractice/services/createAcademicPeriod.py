from practicasAcademicas.models import academicPeriod
from practicasAcademicas.serializers import academicPeriodSerializer
from rest_framework.response import Response
from rest_framework import status

class createAcademicPeriod():
    def MethodCreateAcademicPeriod(self,request):
        serializer = academicPeriodSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return serializer.data