

class SendMail():
    def dividir_lista_por_999_elementos(lista):
        sublistas = []
        sublista_actual = []
        for elemento in lista:
            sublista_actual.append(elemento)
            if len(sublista_actual) == 999:
                sublistas.append(sublista_actual)
                sublista_actual = []
        sublistas.append(sublista_actual)    
        return sublistas
    
    

    def SendEMAIL(self,data):
        from django.core.mail import send_mass_mail
        sublistas = SendMail.dividir_lista_por_999_elementos(data.validated_data['correos_csv'])
        messages=()
        if all(isinstance(sublista, list) for sublista in sublistas):
            for x in sublistas:
                messages +=(data["asunto"].value, data["cuerpo"].value,'yei.lopez@udla.edu.co',x)

        else:
            messages +=(data["asunto"].value, data["cuerpo"].value,'yei.lopez@udla.edu.co',sublistas)


        # send_mass_mail(messages)