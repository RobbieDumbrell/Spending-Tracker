DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS merchants;
DROP TABLE IF EXISTS categories;

CREATE TABLE merchants (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE categories (
  id SERIAL8 PRIMARY KEY,
  type VARCHAR(255)
);

CREATE TABLE transactions (
  id SERIAL8 PRIMARY KEY,
  merchant_id INT8 REFERENCES merchants(id),
  category_id INT8 REFERENCES categories(id),
  amount_spent INT8
);
