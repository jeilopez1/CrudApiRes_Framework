
class NotificationInvitatesSMS():
    def notificationRequestInvitactionSMS(self,data):


        return True


class NotificationInvitatesEMAIL():
    def notificationRequestInvitactionEMAIL(self,emails,subject,text,img):
        from django.core.mail import send_mass_mail

        messages=(
            (),
            ()
        )

        send_mass_mail(
            
            'Ha recibido una solicitud de asistencia para la practica',
            'Prueba',
            'yei.lopez@udla.edu.co',  # Remitente (debe ser una cuenta de Office 365 configurada)
            ['yeissonllespinosa@hotmail.com'],  # Lista de destinatarios
            fail_silently=False,  # Cambia a True para suprimir errores (no recomendado)
            )