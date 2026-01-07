from zeep import Client
from django.shortcuts import render

def index(request):
    cliente = Client('http://localhost:8080/disciplinasws?wsdl')
    temas = cliente.service.getTemas()
    context = {
        'temas': temas
    }
    return render(request, 'index.html', context=context)