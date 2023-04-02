# Sneha Shah and Tara Williams

import os
import sys
import pymysql
import pandas as pd
import numpy as np
from csi3335sp2022 import mysql

def get_columns(csv_cols, table):
    cols = []
    for col in csv_cols:
        col = col.replace('.', '')
        cols.append(col)
    return cols

def insert_data(table, cursor, connection):
    # The CSV files are under csv folder
    csv = 'csv/{}.csv'.format(table)
    
    df = pd.read_csv(csv,sep=',',quotechar="'",encoding='utf8',keep_default_na=False,
                    low_memory = False) #on_bad_lines = 'skip',#sep=',' #quotechar='\''
    df = df.replace(r'^\s*$',None, regex=True) #np.Null
    #df = df.replace(r'inf',99999999,regex=True)
    #(csv, keep_default_na=False, encoding = 'utf8')
    #print(df)

    columns = get_columns(df.columns, table)
    str_columns = ','.join(columns)

    placeholders = ','.join(['%s' for i in range(len(columns))])

    insert_command = 'INSERT INTO {} ({}) VALUES ({})'.format(table, str_columns, placeholders)
    #SET sql_mode = ""
    for df_row in df.iterrows():
        row = df_row[1]
        values = row.to_list()
        try:
            cursor.execute(insert_command, values)
            connection.commit()
        except:
            print(insert_command, values, sep='\n', end='\n----------\n')
            raise

def main():
    location = 'localhost'
    user = 'snehashah' #user = 'root'
    password = '#redbritish' #password = 'csi3335rocks'
    database = 'allstarfull'
    
    con = pymysql.connect(host = location, user = user, password = password, db = database)
    cur = con.cursor()
    
    tables = []
    for root, dirs, files in os.walk('./csv'):
        for file in files:
            if file.endswith('.csv'):
                name = os.path.splitext(file)[0]
                tables.append(name.lower())
        
        
    for table in tables:
            print('insert data into ' + table)
            insert_data(table, cur, con) 
    
    con.commit()
    con.close()

if __name__ == "__main__":
    main()

