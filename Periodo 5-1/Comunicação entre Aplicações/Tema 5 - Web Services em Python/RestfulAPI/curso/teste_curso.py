# -*- coding: utf-8 -*-
import requests
import json

try:
    request = requests.get("http://localhost:5000/tema")
    print(f"Status Code: {request.status_code}")
    print(f"Content-Type: {request.headers.get('Content-Type')}")
    print(f"Response Content: {request.content}")
    print(f"Response Text: {request.text}")
    
    if request.status_code == 200 and request.content:
        temas = json.loads(request.content)
        for t in temas:
            print(str(t['tema_id'])+"::"+t['tema_nome'])
    else:
        print(f"Erro: Status {request.status_code}, resposta vazia ou inválida")
except Exception as e:
    print(f"Erro: {e}")
    import traceback
    traceback.print_exc()