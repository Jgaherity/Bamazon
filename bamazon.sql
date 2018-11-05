DROP DATABASE IF EXISTS bamazon;
CREATE database bamazon;

USE bamazon;

CREATE TABLE products (
  item_id INT NOT NULL AUTO_INCREMENT,
  product_name VARCHAR(200) NOT NULL,
  department_name VARCHAR(200) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  stock_quantity INT NOT NULL,
  PRIMARY KEY (item_id)
);


INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES  ('Wig', 'Beauty', 8.50, 200),
		('Iphone charger', 'Electronics', 12.25, 1000),
		('Kerastas Conditioner', 'Beauty', 40.30, 125),
		('Nike Runners', 'Clothing', 110.00, 78),
		('Chapstick', 'Cosmetics', 3.20, 670),
		('Starbucks cup', 'Home', 13.15, 2120),
		('Kitchen table', 'Home', 350.00, 345),
		('Mac mouse', 'Electronics', 9.99, 85),
		('Water bottle', 'Household', 13.50, 2100),
		('Dove soap', 'beauty', 5.00, 309);
