from django.db import models

# Create your models here.




class Opcion(models.Model):
    Opcion = models.CharField(max_length=500)

    def __str__(self) -> str:
        return str(self.Opcion)

class Unidad(models.Model):
    nombreUnidad = models.CharField(max_length=100)
    nivel = models.CharField(max_length=100)
    antecesor = models.IntegerField()


