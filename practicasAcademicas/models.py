from django.db import models


class statusSubject(models.Model):
  typeStatusSubject = models.CharField(max_length = 100)
  descriptionStatusSubject = models.CharField(max_length = 200)

  def __str__(self) -> str:
    return str(self.typeStatusSubject)

class statusAcademicProgram(models.Model):
  typeStatusAcademicProgram = models.CharField(max_length = 100)
  descriptionStatusAcademicProgram = models.CharField(max_length = 200)

  def __str__(self) -> str:
    return str(self.typeStatusAcademicProgram)

class statusFaculty(models.Model):
  typeStatusFaculty = models.CharField(max_length = 100)
  descriptionStatusFacult = models.CharField(max_length = 200)
  def __str__(self) -> str:
    return str(self.typeStatusFaculty)
  
class faculty(models.Model):
  nameFaculty = models.CharField(max_length = 100)
  statusFaculty = models.ForeignKey(statusFaculty,on_delete = models.CASCADE)
  def __str__(self) -> str:
    return str(self.nameFaculty)
  
class studyModality(models.Model):
  studyModality = models.CharField(max_length = 100)
  descriptionModality = models.CharField(max_length = 200)
  def __str__(self) -> str:
    return str(self.studyModality)

class educationLevel(models.Model):
  educationLevel = models.CharField(max_length = 100)
  descriptionEducationLevel = models.CharField(max_length = 200)
  def __str__(self) -> str:
    return str(self.educationLevel)
  
class academicProgram(models.Model):
  nameAcademicProgram = models.CharField(max_length = 100)
  studyModality = models.ForeignKey(studyModality,on_delete = models.CASCADE)
  educationLevel = models.ForeignKey(educationLevel,on_delete = models.CASCADE)
  statusAcademicProgram = models.ForeignKey(statusAcademicProgram,on_delete = models.CASCADE)
  faculty = models.ForeignKey(faculty,on_delete = models.CASCADE)
  def __str__(self) -> str:
    return str(self.nameAcademicProgram)

class subject(models.Model):
  nameSubject = models.CharField(max_length = 100)
  academicProgram = models.ForeignKey(academicProgram,on_delete = models.CASCADE)
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

class role(models.Model):
  typeRole = models.CharField(max_length = 150)
  descriptionRole = models.CharField(max_length = 200)
  def __str__(self) -> str:
    return str(self.typeRole)

class userRole(models.Model):
  startDate = models.DateTimeField(null = False)
  finaleDate = models.DateTimeField(null = False)
  role = models.ForeignKey(role,on_delete = models.CASCADE)
  user = models.ForeignKey(user,on_delete = models.CASCADE)

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
  descriptionProcessStage = models.CharField(max_length = 60)
  backProcessStage = models.CharField(max_length = 60)
  nextProcessStage = models.CharField(max_length = 60)

class processStageHistory(models.Model):
  datetimeUpdateProcess = models.DateTimeField(null = False)
  user = models.ForeignKey(user, on_delete = models.CASCADE)
  processStage = models.ForeignKey(processStage, on_delete = models.CASCADE)

class applicartion(models.Model):
  datetimeStartapplicartion = models.DateTimeField(null = False)
  datetimeFinalapplicartion = models.DateTimeField(null = False)
  routePracticeProject = models.CharField(max_length = 500)
  routeWorkGuide = models.CharField(max_length = 500)
  typePractice = models.CharField(max_length = 50)
  routeAcceptancedocument = models.CharField(max_length = 500)
  routeContigencyPlan = models.CharField(max_length = 500)
  academicPeriod = models.ForeignKey(academicPeriod, on_delete = models.CASCADE)
  statusApplicartion = models.ForeignKey(statusApplicartion, on_delete = models.CASCADE)
  user = models.ForeignKey(user, on_delete = models.CASCADE)
  processStageHistory = models.ForeignKey(processStageHistory, on_delete = models.CASCADE)

  

