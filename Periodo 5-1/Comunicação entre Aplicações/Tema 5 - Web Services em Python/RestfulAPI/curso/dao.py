# -*- coding: utf-8 -*-
from sqlalchemy import select
from cursodb import postgresql_engine
from entidades import Tema, Modulo
from sqlalchemy.orm import Session

session = Session(postgresql_engine)

class TemaDAO:
    def obterTodos(self):
        stmt = select(Tema)
        return session.scalars(stmt)
    def obter(self,tema_id):
        tema = session.get(Tema, tema_id)
        return tema        
    def incluir(self, tema):
        session.add(tema)
        session.commit()
    def excluir(self,tema_id):
        tema = session.get(Tema, tema_id)
        session.delete(tema)
        session.commit()

class ModuloDAO:
    def obterTodos(self):
        stmt = select(Modulo) 
        return session.scalars(stmt)
    def obterTodosTema(self, tema_id):
        stmt = select(Modulo).where(Modulo.tema_id == tema_id)
        return session.scalars(stmt)
    def incluir(self, modulo):
        session.add(modulo)
        session.commit()
    def excluir(self,modulo_id):
        modulo = session.get(Modulo, modulo_id)
        session.delete(modulo)
        session.commit()