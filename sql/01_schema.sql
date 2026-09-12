CREATE TABLE customers (
  customer_id INTEGER PRIMARY KEY,
  acquisition_date DATE NOT NULL,
  acquisition_channel TEXT NOT NULL
);

CREATE TABLE orders (
  order_id INTEGER PRIMARY KEY,
  customer_id INTEGER NOT NULL REFERENCES customers(customer_id),
  order_date DATE NOT NULL,
  revenue DECIMAL(10,2) NOT NULL
);

