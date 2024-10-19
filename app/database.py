from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

DATABASE_URL = "mysql+pymysql://root:${{secrets.SSH_PASSWORD}}@${{ secrets.SSH_HOST }}:3306/loveappdb"

engine = create_engine(DATABASE_URL,
                       pool_size=20,
                       max_overflow=10,
                       pool_recycle=1800,
                       pool_pre_ping=True)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
