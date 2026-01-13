from sqlalchemy import create_engine

postgresql_engine = create_engine(
    "postgresql://postgres:admin123@10.255.255.254/curso",
    pool_reset_on_return=None,
)