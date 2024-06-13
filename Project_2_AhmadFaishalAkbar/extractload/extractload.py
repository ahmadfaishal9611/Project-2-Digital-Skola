import pandas as pd
from sqlalchemy import create_engine, text
from config import db_url, csv_files

# Function to load data from csv file to db in PostgreSQL
def load_csv_to_table(csv_file, table_name, db_engine, unique_columns):
    # extract data from csv file
    df = pd.read_csv(csv_file)
    
    with db_engine.begin() as conn:
        if len(unique_columns) == 1:
            # listing primary key
            existing_data = pd.read_sql(f'SELECT "{unique_columns[0]}" FROM {table_name}', conn) 
            existing_keys = existing_data[unique_columns[0]].tolist()
            # remove duplicates or avoiding primary key violation
            df = df[~df[unique_columns[0]].isin(existing_keys)]
            # inserting new data
            df.to_sql(table_name, conn, index=False, if_exists='append', method='multi')
            print(f'Load Data {table_name} Success')

        else:
            # listing primary key
            existing_data = pd.read_sql(f'SELECT CONCAT("{unique_columns[0]}":: VARCHAR, "{unique_columns[1]}":: VARCHAR) AS id FROM {table_name}', conn)
            existing_keys = existing_data['id'].tolist()
            df['id'] = df[unique_columns[0]].astype(str) + df[unique_columns[1]].astype(str)
            #remove duplicates or avoiding primary key violation
            prim_keys = df['id'].isin(existing_keys)
            df = df[~prim_keys]
            df.drop(columns=['id'], inplace=True)
            # inserting new data
            df.to_sql(table_name, conn, index=False, if_exists='append', method='multi')
            print(f'Load Data {table_name} Success')

# Connect to db in PostgreSQL
engine = create_engine(db_url)

# Loading data into each table in db
for table_name, (csv_file, unique_columns) in csv_files.items():
    load_csv_to_table(csv_file, table_name, engine, unique_columns)
