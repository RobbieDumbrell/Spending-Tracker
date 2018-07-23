DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS merchants;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS budgets;

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
  merchant_id INT8 REFERENCES merchants(id) ON DELETE CASCADE,
  category_id INT8 REFERENCES categories(id) ON DELETE CASCADE,
  amount_spent INT8,
  entry_date DATE
);

CREATE TABLE budgets (
  id SERIAL8 PRIMARY KEY,
  month INT8,
  month_name VARCHAR(255),
  budget INT8,
  year VARCHAR(255)
)
