

class SendMail():
    def SendEMAIL(self,data):
        from django.core.mail import send_mass_mail
        
        messages = (
             ('Asunto del correo 1', 'Cuerpo del mensaje 1', 'yei.lopez@udla.edu.co', ['yeissonllespinosa@hotmail.com']),
             ('Asunto del correo 2', 'Cuerpo del mensaje 2', 'yei.lopez@udla.edu.co', ['jei.lopez.espinosa@gmail.com']),
              )
        # send_mass_mail(messages)