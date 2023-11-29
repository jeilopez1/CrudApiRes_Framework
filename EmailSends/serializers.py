from rest_framework import serializers
from django.core.validators import FileExtensionValidator
from django.core.exceptions import ValidationError
import csv

class CorreoCSVSerializer(serializers.Serializer):
    correos_csv = serializers.FileField(validators=[FileExtensionValidator(['csv'])])
    cuerpo = serializers.CharField()
    imagenes = serializers.ListField(child=serializers.ImageField(), required=False)
    asunto = serializers.CharField()

    def validate_correos_csv(self, value):
        try:
            correos = value.read().decode('utf-8').split('\n')
            correos = [correo.replace('\r', '') for correo in correos if correo != ""][1:]
            return correos
        except Exception as e:
            raise ValidationError('Error al procesar el archivo CSV')

    def validate(self, data):
        if 'correos_csv' not in data or not data['correos_csv']:
            raise ValidationError('El archivo CSV está vacío o no contiene correos electrónicos')
        return data
