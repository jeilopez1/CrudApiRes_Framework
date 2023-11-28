from rest_framework import serializers
from django.core.validators import FileExtensionValidator
from django.core.exceptions import ValidationError
import csv
from io import TextIOWrapper

class CorreoCSVSerializer(serializers.Serializer):
    correos_csv = serializers.FileField(validators=[FileExtensionValidator(['csv'])])
    cuerpo = serializers.CharField()
    imagenes = serializers.ListField(child=serializers.ImageField(), required=False)
    asunto = serializers.CharField()

    def validate_correos_csv(self, value):
        # Verificar si el archivo CSV tiene el formato correcto y extraer los correos electrónicos
        try:
            decoded_file = value.read().decode('utf-8')
            reader = csv.reader(TextIOWrapper(value, 'utf-8'), delimiter=',')
            print()
            correos = [row[0] for row in reader if row]  # Asumiendo que las direcciones están en la primera columna
            return correos
        except Exception as e:
            raise ValidationError('Error al procesar el archivo CSV')

    def validate(self, data):
        # Asegurarse de que haya correos en el archivo CSV
        if 'correos_csv' not in data or not data['correos_csv']:
            print(data)
            raise ValidationError('El archivo CSV está vacío o no contiene correos electrónicos')
        return data
