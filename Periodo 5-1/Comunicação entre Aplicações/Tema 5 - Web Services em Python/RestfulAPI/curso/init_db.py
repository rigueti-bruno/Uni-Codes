from cursodb import postgresql_engine
from entidades import Base

Base.metadata.create_all(postgresql_engine)