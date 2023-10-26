from practicasAcademicas.models import requestInvitaction,user,userFunction,guestGroup
from .FindFK import FindFK
from django.db.models import Q
import datetime


class InsertInvitates():
  def InsertInvitates(structure, UserFunction, idGuestGroup):
    if len(structure)>0:
      userFunctionInvitate=userFunction.objects.get(userFunction=UserFunction)
      for x in structure:
        ObjrequestInvitaction= requestInvitaction(
          datetimeRequestInvitaction = datetime.datetime.now(),
          user = user.objects.get(id=x.id),
          userFunction = userFunction.objects.get(id=userFunctionInvitate.id),
          guestGroup = guestGroup.objects.get(id=idGuestGroup)
          )
        ObjrequestInvitaction.save()
    return True



class AddRequestInvitation():
      
      def InsertInvitation(self,data,idGuestGroup):
        FKInvitation=FindFK.encontrarFK(self,data)
        #Revisar logica con Tilin

        InsertInvitates.InsertInvitates(FKInvitation["FKSExternalGuests"],"Invitado",idGuestGroup)

        students_in_subject = user.objects.filter(
           usersubject__subject_id=FKInvitation["FKSubject"], userroleacademic__roleAcademic__typeRoleAcademic="Estudiante"
           )
        InsertInvitates.InsertInvitates(students_in_subject,"Estudiante",idGuestGroup)

        return True

