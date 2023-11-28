from rest_framework.views import APIView
from .massMailings.sendMassMailings import BuildSendMassMailings
from rest_framework.response import Response
from rest_framework import status


class ApiMassMailings(APIView):
    def post(self,request):
        return Response(BuildSendMassMailings.constructSendMassMailings(self,request),status=status.HTTP_201_CREATED)

        pass