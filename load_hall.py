# File: load_hall.py
# Author: Emily Liau
# Course: CSI/DSC 3335
# Assignment: Spring 2022 Course Project
# Due Date: 5/1/2022
#
# Description: This file is a single Python program that loads the hall of fame data. The data source must be included
# with the project, and the data will be located in the same directory as the Python file.

import pymysql
import pandas as pd

def get_columns(csv_cols, table):
    cols = []
    for col in csv_cols:
        col = col.replace('.', '')
        cols.append(col)
    return cols

def main():
    location = 'localhost'
    user = 'snehashah'
    password = '#redbritish'
    database = 'allstarfull'

    con = pymysql.connect(host=location, user=user, password=password, db=database)
    cur = con.cursor()

    print('insert data into hall of fame')

    # insert new hall of fame data into database
    csv = 'NewHallOfFame.csv'

    #df = pd.read_csv(csv, keep_default_na=False)
    df = pd.read_csv(csv,sep=',',quotechar="'",encoding='utf8',keep_default_na=False,
                    low_memory = False)
    df = df.replace(r'^\s*$',None, regex=True)

    columns = get_columns(df.columns, "halloffame")
    str_columns = ','.join(columns)

    placeholders = ','.join(['%s' for i in range(len(columns))])

    insert_command = 'INSERT INTO halloffame ({}) VALUES ({})'.format(str_columns, placeholders)

    for df_row in df.iterrows():
        row = df_row[1]
        values = row.to_list()
        try:
            cur.execute(insert_command, values)
            con.commit()
            
        except:
            print(insert_command, values, sep='\n', end='\n----------\n')
            raise

    con.commit()
    con.close()


if __name__ == "__main__":
    main()
