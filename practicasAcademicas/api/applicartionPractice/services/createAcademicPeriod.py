from practicasAcademicas.models import academicPeriod
from practicasAcademicas.serializers import academicPeriodSerializer

class createAcademicPeriod():
    def MethodCreateAcademicPeriod(self,request):
        serializer = academicPeriodSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return serializer.data