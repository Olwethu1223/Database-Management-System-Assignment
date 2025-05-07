-- Online Boutique Inventory System

-- DATABASE CREATION
CREATE DATABASE boutique_db;
USE boutique_db;

-- CATEGORY TABLE
CREATE TABLE category (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE
);

-- SUPPLIER TABLE
CREATE TABLE supplier (
  supplier_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  contact_email VARCHAR(100) UNIQUE
);

-- PRODUCT TABLE
CREATE TABLE product (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  stock_quantity INT NOT NULL,
  category_id INT,
  supplier_id INT,
  FOREIGN KEY (category_id) REFERENCES category(category_id),
  FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id)
);

-- CUSTOMER TABLE
CREATE TABLE customer (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE,
  phone VARCHAR(15)
);

-- ORDER TABLE
CREATE TABLE `order` (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  order_date DATE NOT NULL,
  customer_id INT,
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- ORDER_ITEM TABLE
CREATE TABLE order_item (
  order_id INT,
  product_id INT,
  quantity INT NOT NULL,
  PRIMARY KEY (order_id, product_id),
  FOREIGN KEY (order_id) REFERENCES `order`(order_id),
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- SAMPLE DATA INSERTION

-- Insert Categories
INSERT INTO category (name) VALUES ('Tops'), ('Bottoms'), ('Accessories');

-- Insert Suppliers
INSERT INTO supplier (name, contact_email) VALUES ('Yaniik Styles', 'contact@yaniik.com'), ('TrendyCo', 'support@trendyco.com');

-- Insert Products
INSERT INTO product (name, price, stock_quantity, category_id, supplier_id) VALUES
  ('Graphic Tee', 199.99, 50, 1, 1),
  ('Denim Jeans', 349.95, 30, 2, 2),
  ('Bucket Hat', 129.50, 40, 3, 1);

-- Insert Customers
INSERT INTO customer (full_name, email, phone) VALUES
  ('Amahle Mathebula', 'ama@boutique.co.za', '0723456789'),
  ('Awande Lushozi', 'awa@gmail.com', '0821234567');

-- Insert Orders
INSERT INTO `order` (order_date, customer_id) VALUES
  ('2025-05-05', 1),
  ('2025-05-06', 2);

-- Insert Order Items
INSERT INTO order_item (order_id, product_id, quantity) VALUES
  (1, 1, 2),
  (1, 3, 1),
  (2, 2, 1);

-- END OF FILE
