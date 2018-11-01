Skip to content
 
Search or jump to…

Pull requests
Issues
Marketplace
Explore
 @Jgaherity Sign out
1
0 0 lexluther2125/Bamazon
 Code  Issues 0  Pull requests 0  Projects 0  Wiki  Insights
Bamazon/bamazon.sql
a639855  on Jul 21, 2017
 Lexi updating products
     
30 lines (24 sloc)  1.05 KB
DROP DATABASE IF EXISTS bamazonDB;

CREATE DATABASE bamazonDB;

USE bamazonDB;

CREATE TABLE products (
item_id INT NOT NULL AUTO_INCREMENT,
product_name VARCHAR(300) NULL,
department_name VARCHAR(300) NULL,
price DECIMAL(10,2) NULL,
stock_quantity INT NULL,
PRIMARY KEY (item_id) 
);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES 
("To Kill A Mockingbird by Harper Lee", "Books", 10.99, 265),
("E.T. the Extra Terrestrial", "Movies", 12.21, 300),
("Apple iPad with WiFi, 32GB, Space Gray", "Electronics", 258.99, 6),
("Modway Engage Upholstered Sofa in Gray", "Home", 923.98, 5),
("KIND Nuts and Spices Bar, Dark Chocolate/Nuts/Sea Salt 12ct", "Food", 14.05, 375),
("Neutrogena Makeup Remover Cleansing Towelettes Refill Pack, 25 Count", "Beauty", 18.73, 300),
("4M Crystal Growing Experiment", "Toys", 16.54, 346),
("Kate Spade New York Womens Cactus Crosstown", "Clothing", 195, 35),
("Green earrings glass drop sterling silver", "Handmade", 26.00, 5),
("Unipack Neoprene Dumbbells", "Sports", 11.93, 54);


SELECT * FROM products;
© 2018 GitHub, Inc.
Terms
Privacy
Security
Status
Help
Contact GitHub
Pricing
API
Training
Blog
About
Press h to open a hovercard with more details.