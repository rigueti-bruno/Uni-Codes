# Janela com texto, imagem e botão:
from tkinter import *

# Função do Botão:
def funcClicar():
    print('Botão pressionado!')

# Cria a janela:
janelaPrincipal = Tk()

# Insere o Texto:
texto = Label(master=janelaPrincipal, text='Minha janela exibida!')
texto.pack()

# Insere a Imagem:
pic = PhotoImage(file="lobo.png",width=300, height=300,)
logo = Label(master=janelaPrincipal, image=pic)
logo.pack()

# Insere o Botão:
botao = Button(master=janelaPrincipal, text='Clique', command=funcClicar)
botao.pack()

janelaPrincipal.mainloop()