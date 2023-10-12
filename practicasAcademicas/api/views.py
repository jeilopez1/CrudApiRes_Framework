from rest_framework.views import APIView
from .applicartionPractice.applicartion import BuildRequest
from rest_framework.response import Response
from rest_framework import status
from practicasAcademicas.serializers import academicPeriodSerializer

class ApiViewRequest(APIView):
    def get(self,request):
        return Response(BuildRequest.CualquierMetodo(), status=status.HTTP_201_CREATED)

    def post(self, request):
        print(request.data)
        serializer = academicPeriodSerializer(data=request.data)

        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
