-- TABLE CARDS_DATA
-- Melakukan penghapusan nilai '$' pada kolom credit_limit dan mengubah tipe data menjadi numeric
alter table cards_data
alter column credit_limit type numeric
using replace(credit_limit, '$','')::numeric;

-- TABLE TRANSACTION_DATA_2019
-- Melakukan penghapusan nilai '$' pada kolom amount dan mengubah tipe data menjadi numeric
alter table transaction_data_2019 
alter column amount type numeric
using replace(amount, '$','')::numeric;

-- TABLE USERS_DATA
-- Melakukan penghapusan nilai '$' pada kolom amount dan mengubah tipe data menjadi numeric
alter table users_data
alter column per_capita_income type numeric
using replace(per_capita_income, '$','')::numeric,
alter column yearly_income type numeric
using replace(yearly_income, '$','')::numeric,
alter column total_debt type numeric
using replace(total_debt, '$','')::numeric;




