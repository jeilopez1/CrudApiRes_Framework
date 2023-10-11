from rest_framework.views import APIView
from .applicartionPractice.request import BuildRequest
from rest_framework.response import Response
from rest_framework import status

class ApiViewRequest(APIView):
    def get(self,request):
        return Response(BuildRequest.CualquierMetodo(), status=status.HTTP_201_CREATED)

