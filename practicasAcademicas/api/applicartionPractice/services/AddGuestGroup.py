from practicasAcademicas.models import guestGroup,user,subject
from .FindFK import FindFK
import datetime

class AddGuestGroup():
    def InsertGuestGroup(self,data):
        FKS=FindFK.encontrarFK(self,data)
        nameTeacherRequest=user.objects.get(id=data["user"].value).nameUser
        ObjguestGroup=guestGroup(
            nameGroup=f'{nameTeacherRequest}, {datetime.datetime.now()}',
            groupDescription = f'Grupo Solicitado por {nameTeacherRequest}, Docente de la asignatura:{subject.objects.get(id=data["idSubject"].value).nameSubject}',
        )
        ObjguestGroup.save()

        return ObjguestGroup.id
            