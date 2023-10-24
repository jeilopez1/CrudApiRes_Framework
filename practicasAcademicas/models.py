from django.db import models
from django.contrib.auth.models import Permission
from django.contrib.contenttypes.models import ContentType
from django.db import models

class CRUDPermission(models.Model):
    class Meta:
        permissions = [
            ("can_CRUD", "Can perform CRUD operations"),
        ]


class statusSubject(models.Model):
  typeStatusSubject = models.CharField(max_length = 100)
  descriptionStatusSubject = models.CharField(max_length = 200)

  def __str__(self) -> str:
    return str(self.typeStatusSubject)

class statusUnit(models.Model):
  typeStatusunit = models.CharField(max_length = 100)
  descriptionStatusunit = models.CharField(max_length = 200)

  def __str__(self) -> str:
    return str(self.typeStatusunit)
  
class typeUnit(models.Model):
  nameType = models.CharField(max_length = 70)
  descriptionTypeUnit = models.CharField(max_length = 500)
  def __str__(self) -> str:
    return str(self.nameType)
  
class studyModality(models.Model):
  studyModality = models.CharField(max_length = 100)
  descriptionModality = models.CharField(max_length = 200)
  def __str__(self) -> str:
    return str(self.studyModality)

class educationLevel(models.Model):
  educationLevel = models.CharField(max_length = 100)
  descriptionEducationLevel = models.CharField(max_length = 500)
  def __str__(self) -> str:
    return str(self.educationLevel)
  
class unit(models.Model):
    nameunit = models.CharField(max_length=100)
    ancestor = models.ForeignKey('self', on_delete=models.CASCADE, null=True, blank=True)
    descriptionUnit = models.CharField(max_length=500)
    studyModality = models.ForeignKey(studyModality, on_delete=models.CASCADE)
    educationLevel = models.ForeignKey(educationLevel, on_delete=models.CASCADE)
    statusUnit = models.ForeignKey(statusUnit, on_delete=models.CASCADE)
    typeUnit = models.ForeignKey(typeUnit, on_delete=models.CASCADE)

    def get_ancestor(self):
        if self.ancestor is None:
            return self
        else:
            return self.ancestor.get_ancestor()
    def __str__(self) -> str:
      return str(self.nameunit)

class subject(models.Model):
  nameSubject = models.CharField(max_length = 100)
  unit = models.ForeignKey(unit,on_delete = models.CASCADE)
  statusSubject = models.ForeignKey(statusSubject,on_delete = models.CASCADE)
  def __str__(self) -> str:
    return str(self.nameSubject)
  
class statusUser(models.Model):
  typeStatusUser = models.CharField(max_length = 100)
  descriptionStatusUser = models.CharField(max_length = 200)

  def __str__(self) -> str:
    return str(self.typeStatusUser)
  
class typeIdentification(models.Model):
  typeIdentification = models.CharField(max_length = 100)
  descriptionTypeIdentification = models.CharField(max_length = 200)

  def __str__(self) -> str:
    return str(self.typeIdentification)

class user(models.Model):
  nameUser = models.CharField(max_length = 100)
  lastNameUser = models.CharField(max_length = 100)
  PEGE_ID = models.IntegerField()
  identificationNumber = models.IntegerField()
  typeIdentification = models.ForeignKey(typeIdentification,on_delete = models.CASCADE)
  statusUser = models.ForeignKey(statusUser,on_delete = models.CASCADE)
  def __str__(self) -> str:
    return str(self.nameUser)

class userSubject(models.Model):
  updateDate = models.DateTimeField(null = False)
  user = models.ForeignKey(user,on_delete = models.CASCADE)
  subject = models.ForeignKey(subject,on_delete = models.CASCADE)
  def __str__(self) -> str:
    return str(f'{self.user} - {self.subject}')

class roleAcademic(models.Model):
  typeRoleAcademic = models.CharField(max_length = 150)
  descriptionRoleAcademic = models.CharField(max_length = 200)
  def __str__(self) -> str:
    return str(self.typeRoleAcademic)

class userRoleAcademic(models.Model):
  startDate = models.DateTimeField(null = False)
  finaleDate = models.DateTimeField(null = False)
  roleAcademic = models.ForeignKey(roleAcademic,on_delete = models.CASCADE)
  user = models.ForeignKey(user,on_delete = models.CASCADE)
  def __str__(self) -> str:
    return str(self.user)

class userFunction(models.Model):
  userFunction = models.CharField(max_length = 50)
  descriptionUser = models.CharField(max_length = 200)
  def __str__(self) -> str:
    return str(self.userFunction)

class guestGroup(models.Model):
  nameGroup = models.CharField(max_length = 700)
  groupDescription = models.CharField(max_length = 700)
  def __str__(self) -> str:
    return str(self.nameGroup)

class requestInvitaction(models.Model):
  datetimeRequestInvitaction = models.DateTimeField(null = False)
  user = models.ForeignKey(user,on_delete = models.CASCADE)
  userFunction = models.ForeignKey(userFunction,on_delete = models.CASCADE)
  guestGroup = models.ForeignKey(guestGroup,on_delete = models.CASCADE)
  
class notificationRequestInvitaction(models.Model):
  notificationDetail = models.CharField(max_length = 700)
  meansNotification = models.CharField(max_length = 60)
  datetimeNotification = models.DateTimeField(null = False)
  user = models.ForeignKey(user,on_delete = models.CASCADE)
  requestInvitaction = models.ForeignKey(requestInvitaction, on_delete = models.CASCADE)

class academicPeriod(models.Model):
  datetimeStartPeriod = models.DateTimeField(null = False)
  datetimeFinalPeriod = models.DateTimeField(null = False)
  datetimeFinalApplication  = models.DateTimeField(null = False)
  year = models.IntegerField()
  semester = models.IntegerField()
  def __str__(self) -> str:
    return str(f'{self.datetimeStartPeriod} - {self.datetimeFinalPeriod}')
  
class statusApplicartion(models.Model):
  typeStatusApplicartion = models.CharField(max_length = 60)
  descriptionStatusApplicartion = models.CharField(max_length = 500)
  def __str__(self) -> str:
    return str(self.typeStatusApplicartion)
  
class processStage(models.Model):
  nameProcessStage = models.CharField(max_length = 60)
  descriptionProcessStage = models.CharField(max_length = 500)
  backProcessStage = models.CharField(max_length = 60)
  nextProcessStage = models.CharField(max_length = 60)
  def __str__(self) -> str:
    return str(self.nameProcessStage)

class processStageHistory(models.Model):
  datetimeUpdateProcess = models.DateTimeField(null = False)
  user = models.ForeignKey(user, on_delete = models.CASCADE)
  processStage = models.ForeignKey(processStage, on_delete = models.CASCADE)
  justification = models.CharField(max_length = 500)
  def __str__(self) -> str:
    return str(self.processStage)
  
class typeAcademicPractice(models.Model):
  typeAcademicPractice = models.CharField(max_length = 50)
  DescriptionAcademicPractice = models.CharField(max_length = 500)

  def __str__(self) -> str:
    return str(self.typeAcademicPractice)

class applicartion(models.Model):
  datetimeStartapplicartion = models.DateTimeField(null = False)
  datetimeFinalapplicartion = models.DateTimeField(null = False)
  routePracticeProject = models.FileField(upload_to='projects/',db_index=True)
  routeWorkGuide = models.FileField(upload_to='workGuide/',db_index=True)
  routeAcceptancedocument = models.FileField(upload_to='acceptanceDocument/',null=True)
  routeContigencyPlan = models.FileField(upload_to='contingencyPlan/')
  academicPeriod = models.ForeignKey(academicPeriod, on_delete = models.CASCADE)
  statusApplicartion = models.ForeignKey(statusApplicartion, on_delete = models.CASCADE)
  user = models.ForeignKey(user, on_delete = models.CASCADE)
  processStageHistory = models.ForeignKey(processStageHistory, on_delete = models.CASCADE)
  typeAcademicPractice = models.ForeignKey(typeAcademicPractice, on_delete = models.CASCADE,null = True)
  def __str__(self) -> str:
    return str(f'{self.user} - {self.processStageHistory}')

class practiceAssistants(models.Model):
  datetimeConfirmation = models.DateTimeField(null = False)
  nameEPS = models.CharField(max_length = 50)
  certificateEPS = models.FileField(upload_to='files/certificatesEPS/')
  applicartion = models.ForeignKey(applicartion, on_delete = models.CASCADE)
  requestInvitaction = models.ForeignKey(requestInvitaction, on_delete = models.CASCADE)

class workerRole(models.Model):
  nameWorkerRole = models.CharField(max_length = 50)
  DescriptionWorkerRole = models.CharField(max_length = 500)
  def __str__(self) -> str:
    return str(self.nameWorkerRole)

class workerUnit(models.Model):
  datetimeCreate = models.DateTimeField(null = False)
  unit = models.ForeignKey(unit, on_delete = models.CASCADE)
  user = models.ForeignKey(user, on_delete = models.CASCADE)
  workerRole = models.ForeignKey(workerRole, on_delete = models.CASCADE)
  def __str__(self) -> str:
    return f"{self.user} - {self.workerRole}"
