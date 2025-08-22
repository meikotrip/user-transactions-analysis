import pandas as pd
import os

input_file = '' #PATH TRANSACTIONS DATA

# Baca file CSV ke dalam DataFrame
try:
    df = pd.read_csv(input_file)
    print("File berhasil dimuat.")
except FileNotFoundError:
    print(f"Error: File '{input_file}' tidak ditemukan.")
    exit()

# Konversi kolom 'date' menjadi tipe data datetime
df['date'] = pd.to_datetime(df['date'])
print("Tipe data kolom 'date' berhasil diubah.")

# Ekstrak tahun dari kolom 'date' dan buat kolom 'year' baru
df['year'] = df['date'].dt.year

# Cari daftar tahun unik
unique_years = df['year'].unique()
print(f"Tahun unik yang ditemukan: {unique_years}")

# Buat folder untuk menyimpan file output jika belum ada
output_folder = 'transaction_by_year'
if not os.path.exists(output_folder):
    os.makedirs(output_folder)
    print(f"Folder '{output_folder}' berhasil dibuat.")

# Lakukan perulangan untuk setiap tahun dan simpan ke file baru
for year in unique_years:
    # Filter DataFrame untuk tahun tertentu
    df_year = df[df['year'] == year]
    
    # Nama file output
    output_file = os.path.join(output_folder, f'transaction_{year}.csv')
    
    # Simpan data ke file CSV baru tanpa menyertakan indeks
    df_year.to_csv(output_file, index=False)
    
    print(f"File '{output_file}' berhasil disimpan dengan {len(df_year)} baris.")

print("\nProses pembagian file selesai.")