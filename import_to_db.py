import os
import pandas as pd
from sqlalchemy import create_engine
from tqdm import tqdm

# Database connection parameters
DB_HOST = ""
DB_PORT = ""
DB_NAME = ""
DB_USER = ""
DB_PASS = ""

DATASET_FOLDER = "dataset"

def import_csv_to_postgres(csv_file, table_name, engine, chunksize=1000):
    total_rows = sum(1 for _ in open(csv_file)) - 1  # exclude header
    reader = pd.read_csv(csv_file, chunksize=chunksize)
    with tqdm(total=total_rows, desc=f"Importing {table_name}") as pbar:
        for chunk in reader:
            chunk.to_sql(table_name, engine, if_exists='append', index=False)
            pbar.update(len(chunk))

def main():
    engine = create_engine(
        f"postgresql://{DB_USER}:{DB_PASS}@{DB_HOST}:{DB_PORT}/{DB_NAME}"
    )
    for filename in os.listdir(DATASET_FOLDER):
        if filename.endswith(".csv"):
            csv_path = os.path.join(DATASET_FOLDER, filename)
            table_name = os.path.splitext(filename)[0]
            import_csv_to_postgres(csv_path, table_name, engine)
    engine.dispose()

if __name__ == "__main__":
    main()
