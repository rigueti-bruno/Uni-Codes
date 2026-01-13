# -*- coding: utf-8 -*-
from sqlalchemy import Column
from sqlalchemy import ForeignKey
from sqlalchemy import Integer
from sqlalchemy import String
from sqlalchemy.orm import declarative_base
from sqlalchemy.orm import relationship

Base = declarative_base()

class Tema(Base):
    __tablename__ = "tema"
    tema_id = Column(Integer, primary_key=True)
    tema_nome = Column(String(255))
    modulos = relationship(
        "Modulo", back_populates="tema", cascade="all, delete-orphan"
    )

class Modulo(Base):
    __tablename__ = "modulo"
    modulo_id = Column(Integer, primary_key=True)
    modulo_nome = Column(String(255))
    tema_id = Column(Integer, ForeignKey("tema.tema_id"))
    tema = relationship("Tema", back_populates="modulos")