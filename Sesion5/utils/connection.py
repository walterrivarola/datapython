import pandas as pandas
import sqlalchemy as db
from sqlalchemy import text

def connect_retail_db():
    engine = db.create_engine("mysql://root:root@172.16.5.4:3310/retail_db")
    conn = engine.connect()

    return conn

def connect_dw_retail():
    engine = db.create_engine("mysql://root:root@172.16.5.4:3310/dw_retail")
    conn = engine.connect()

    return conn