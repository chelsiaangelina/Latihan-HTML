-- membuat data base
CREATE DATABASE netstore_24_bda;
-- menghapus database
DROP DATABASE netstore_24_bda;

-- membuat dan menggunakan database
CREATE DATABASE netstore_24_bda;
USE netstore_24_bda;

-- membuat tabel
CREATE TABLE customers (
customer_id INT,
frist_name VARCHAR (50),
last_name VARCHAR (50),
email VARCHAR (100),
phone VARCHAR (20), 
PRIMARY KEY (customer_id)
);
-- melihat tabel
DESCRIBE customers;

-- menambahkan kolom baru dan melihat hasilnya
ALTER TABLE customers ADD address VARCHAR(200);
DESCRIBE customers;


