--- EKSPLORASI DATA PADA TABEL USERS ---
-- Jumlah User Berdasarkan Gender
select gender, count(id) as total_users
from users_data ud 
group by gender
order by total_users desc;


--- EKSPLORASI DATA PADA TABEL CARDS ---
-- Total Card Berdasarkan Brand
SELECT card_brand, count(id) AS total_card 
FROM cards_data cd 
GROUP BY card_brand 
ORDER BY total_card DESC ;

-- Total Card Berdasarkan Type
SELECT card_type, count(id) AS total_card 
FROM cards_data cd 
GROUP BY card_type 
ORDER BY total_card DESC; 


--- EKPLORASI DATA PADA TABEL TRANSACTIONS DAN JOIN TABLE ---
-- Total Transaksi berdasarkan Use Chip
select use_chip, count(id) as total_transactions
from transaction_data_2019 td 
group by use_chip 
order by total_transactions desc;


-- Jumlah Transaksi pada Tabel Transaksi
select count(1) as total_transactions
from transaction_data_2019 td;

-- Total Merchant pada Tabel Transaksi
select count(distinct merchant_city) as total_merchant
from transaction_data_2019 td;

-- Average dari Age User
select round(avg(ud.current_age)) as average_age
from users_data ud 
right join transaction_data_2019 td 
on ud.id = td.client_id;

-- Average Cards yang Dimiliki User
select round(avg(ud.num_credit_cards)) as average_num_cc_users 
from users_data ud
right join transaction_data_2019 td 
on ud.id = td.client_id;

-- Average dari Total Debt User
select (avg(ud.total_debt)) as average_total_debt_users 
from users_data ud
right join transaction_data_2019 td 
on ud.id = td.client_id;

-- Sum dari Amount User
select sum(amount) as sum_of_amount_user
from transaction_data_2019 td;

-- Average dari Yearly Income User
select (avg(ud.yearly_income)) as average_yearly_income_users 
from users_data ud
right join transaction_data_2019 td 
on ud.id = td.client_id;

-- Top 100 Merchant dengan total transaksi terbanyak oleh user
select merchant_city, count(id) as total_transactions
from transaction_data_2019 td 
group by merchant_city 
order by total_transactions desc
limit 100;

-- List Transaksi Error yang dilakukan User
select td.errors, count(td.id) as total_transactions
from transaction_data_2019 td
where td.errors is not null
group by td.errors 
order by total_transactions desc;

-- Trend Total Transactions dan Total Amount User day by day
select date(date) as transaction_days, count(id) as total_transactions, sum(amount) as total_amount
from transaction_data_2019 td 
group by transaction_days
order by transaction_days asc;


