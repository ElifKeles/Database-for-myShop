DROP DATABASE IF EXISTS `myShop`;
CREATE DATABASE `myShop`; 
USE `myShop`;

SET NAMES utf8 ;
SET character_set_client = utf8mb4 ;


CREATE TABLE status
(
  status_id INT PRIMARY KEY,
  name VARCHAR(40)
);
INSERT INTO status VALUES(1, 'preparing');
INSERT INTO status VALUES(2, 'on the way');
INSERT INTO status VALUES(3, 'delivered');


CREATE TABLE brand
(
  brand_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(40)
);
INSERT INTO brand VALUES(1, 'Paper Company');
INSERT INTO brand VALUES(2, 'New Age Books');
INSERT INTO brand VALUES(3, 'Tech Zone');
INSERT INTO brand VALUES(4, 'Smart Roof');
INSERT INTO brand VALUES(5, 'Diamond');
INSERT INTO brand VALUES(6, 'Road Runners');
INSERT INTO brand VALUES(7, 'Wash');
INSERT INTO brand VALUES(8, 'FFood');
INSERT INTO brand VALUES(9, 'Starbucks');
INSERT INTO brand VALUES(10, 'Lego');


CREATE TABLE category
(
  category_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(40)
);
INSERT INTO category VALUES(1, 'stationery');
INSERT INTO category VALUES(2, 'book');
INSERT INTO category VALUES(3, 'technology');
INSERT INTO category VALUES(4, 'construction');
INSERT INTO category VALUES(5, 'accessory');
INSERT INTO category VALUES(6, 'shoe');
INSERT INTO category VALUES(7, 'cleaning');
INSERT INTO category VALUES(8, 'food');
INSERT INTO category VALUES(9, 'clothing');
INSERT INTO category VALUES(10, 'toy');


CREATE TABLE product
(
  product_id INT PRIMARY KEY AUTO_INCREMENT,
  category INT,
  name VARCHAR(40),
  brand_name VARCHAR(40),
  FOREIGN KEY(category) REFERENCES category(category_id) ON DELETE SET NULL
);
INSERT INTO product VALUES(1, 1, 'pencils', 'Paper Company');
INSERT INTO product VALUES(2, 2, 'childrens books', 'New Age Books');
INSERT INTO product VALUES(3, 3, 'personal computer', 'Tech Zone');
INSERT INTO product VALUES(4, 4, 'clay', 'Smart Roof');
INSERT INTO product VALUES(5, 5, 'jewellery', 'Diamond');
INSERT INTO product VALUES(6, 6, 'running shoes', 'Road Runners');
INSERT INTO product VALUES(7, 7, 'detergent', 'Wash');
INSERT INTO product VALUES(8, 8, 'burger', 'FFood');
INSERT INTO product VALUES(9, 9, 'coffee', 'Starbucks');
INSERT INTO product VALUES(10, 10, 'lego', 'Lego');


CREATE TABLE product_price
(
  product_id INT PRIMARY KEY,
  price DECIMAL(6,2) NOT NULL
);
INSERT INTO product_price VALUES(1, 2);
INSERT INTO product_price VALUES(2, 5);
INSERT INTO product_price VALUES(3, 1500);
INSERT INTO product_price VALUES(4, 20);
INSERT INTO product_price VALUES(5, 20);
INSERT INTO product_price VALUES(6, 100);
INSERT INTO product_price VALUES(7, 10);
INSERT INTO product_price VALUES(8, 10);
INSERT INTO product_price VALUES(9, 100);
INSERT INTO product_price VALUES(10, 20);


CREATE TABLE product_quantity
(
  product_id INT PRIMARY KEY,
  quantity INT DEFAULT 1
);
INSERT INTO product_quantity VALUES(1, 100);
INSERT INTO product_quantity VALUES(2, 20);
INSERT INTO product_quantity VALUES(3, 20);
INSERT INTO product_quantity VALUES(4, 10);
INSERT INTO product_quantity VALUES(5, 100);
INSERT INTO product_quantity VALUES(6, 15);
INSERT INTO product_quantity VALUES(7, 100);
INSERT INTO product_quantity VALUES(8, 100);
INSERT INTO product_quantity VALUES(9, 10);
INSERT INTO product_quantity VALUES(10, 100);


CREATE TABLE employee 
(
  employee_id INT PRIMARY KEY ,
  name VARCHAR(40),
  surname VARCHAR(40),
  birthday DATE,
  phone VARCHAR(40),
  salary INT
);
INSERT INTO employee VALUES(100, 'Sarah', 'Smith', '1968-02-19', '781-932-9754', 63996);
INSERT INTO employee VALUES(105, 'Clara', 'Brown', '1999-03-14', '804-427-9456', 110150);
INSERT INTO employee VALUES(303, 'Sam', 'Jackson', '1990-11-11', '719-724-7869', 94860);
INSERT INTO employee VALUES(401, 'Will', 'Blue', '1969-01-30', '407-231-8017', 52832);
INSERT INTO employee VALUES(598, 'Hailey', 'Grace', '1997-05-12', '312-480-8498', 32179);
INSERT INTO employee VALUES(688, 'Logan', 'Dawson', '1968-10-04', '615-641-4759', 77182);
INSERT INTO employee VALUES(771, 'Ann', 'Daniele', '1987-02-03', '941-527-3977', 67987);
INSERT INTO employee VALUES(101, 'Alex', 'Gordon', '1986-06-17', '559-181-3744', 119241);
INSERT INTO employee VALUES(900, 'George', 'Johnson', '1996-12-15', '404-246-3370', 62871);
INSERT INTO employee VALUES(102, 'Lisa', 'Woodson', '1987-07-14', NULL, 98926);


CREATE TABLE branch 
(
  branch_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(40),
  manager_id INT,
  FOREIGN KEY(manager_id) REFERENCES employee(employee_id) ON DELETE SET NULL
);
INSERT INTO branch VALUES(1, 'New York', 101);
INSERT INTO branch VALUES(2, 'Buffalo', 102);
INSERT INTO branch VALUES(3, 'Chicago', 105);


CREATE TABLE employee_manager
(
  employee_id INT PRIMARY KEY ,
  manager_id INT,
  FOREIGN KEY(manager_id) REFERENCES branch(manager_id) 
);
INSERT INTO employee_manager VALUES(100, 105);
INSERT INTO employee_manager VALUES(105, NULL);
INSERT INTO employee_manager VALUES(303, 105);
INSERT INTO employee_manager VALUES(401, 105);
INSERT INTO employee_manager VALUES(598, 101);
INSERT INTO employee_manager VALUES(688, 101);
INSERT INTO employee_manager VALUES(771, 102);
INSERT INTO employee_manager VALUES(101, NULL);
INSERT INTO employee_manager VALUES(900, 102);
INSERT INTO employee_manager VALUES(102, NULL);

CREATE TABLE employee_branch
(
  employee_id INT PRIMARY KEY ,
  branch_id INT,
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);
INSERT INTO employee_branch VALUES(100, 3);
INSERT INTO employee_branch VALUES(105, 3);
INSERT INTO employee_branch VALUES(303, 3);
INSERT INTO employee_branch VALUES(401, 3);
INSERT INTO employee_branch VALUES(598, 1);
INSERT INTO employee_branch VALUES(688, 1);
INSERT INTO employee_branch VALUES(771, 2);
INSERT INTO employee_branch VALUES(101, 1);
INSERT INTO employee_branch VALUES(900, 2);
INSERT INTO employee_branch VALUES(102, 2);


CREATE TABLE customer 
(
  customer_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(40),
  surname VARCHAR(40),
  birthday DATE,
  phone VARCHAR(40),
  address VARCHAR(40),
  city VARCHAR(40),
  state VARCHAR(40),
  total_shopping INT
);
INSERT INTO customer VALUES(1, 'Julia', 'Williams', '1997-02-28', '579-161-3724', '0 Sage Terrace', 'Waltham', 'MA', 34);
INSERT INTO customer VALUES(2, 'Hayley', 'Wallace', '1999-10-24', '897-181-2135', '14187 Commercial Trail', 'Hampton', 'VA', 46);
INSERT INTO customer VALUES(3, 'Roger', 'Walker', '1988-07-21', '923-763-3741', '251 Springs Junction', 'Colorado Springs', 'CO', 19);
INSERT INTO customer VALUES(4, 'Jack', 'Kenneth', '1997-12-03', '561-182-9077', '30 Arapahoe Terrace', 'Orlando', 'FL', 1);
INSERT INTO customer VALUES(5, 'Edward', 'True', '1996-04-20', '908-243-7532', '5 Spohn Circle', 'Arlington', 'TX', 3);
INSERT INTO customer VALUES(6, 'Joe', 'Sparks', '1991-05-16', '887-156-9824', '34267 Glendale Parkway','Huntington','WV', 30 );
INSERT INTO customer VALUES(7, 'Taylor', 'Rose', '1994-09-30', '980-547-8743', '50 Lillian Crossing', 'Nashville', 'TN', 21);
INSERT INTO customer VALUES(8, 'Betty', 'James', '1998-01-11', '231-908-0909', '7 Manley Drive', 'Chicago', 'IL', 6);
INSERT INTO customer VALUES(9, 'Peter', 'Robinson', '1989-09-23', '332-652-9162', '520 Ohio Trail', 'Visalia', 'CA', 2);
INSERT INTO customer VALUES(10, 'Ketie', 'Thomas', '1967-11-19', '652-102-6790', '68 Lawn Avenue', 'Atlanta', 'GA', 5);


CREATE TABLE orders
(
  order_id INT PRIMARY KEY AUTO_INCREMENT,
  customer_id INT, 
  order_date DATE,
  FOREIGN KEY(customer_id) REFERENCES customer(customer_id) ON DELETE SET NULL
);
INSERT INTO orders VALUES(1, 1, '2020-02-28' );
INSERT INTO orders VALUES(2, 2, '2020-01-03' );
INSERT INTO orders VALUES(3, 3, '2020-09-20' );
INSERT INTO orders VALUES(4, 4, '2021-01-29' );
INSERT INTO orders VALUES(5, 5, '2021-02-25' );
INSERT INTO orders VALUES(6, 6, '2020-05-08' );
INSERT INTO orders VALUES(7, 7, '2019-05-19' );
INSERT INTO orders VALUES(8, 8, '2020-06-22' );
INSERT INTO orders VALUES(9, 9, '2021-04-21' );
INSERT INTO orders VALUES(10, 10, '2021-01-05' );

CREATE TABLE order_status
(
  order_id INT PRIMARY KEY,
  status INT DEFAULT '1',
  FOREIGN KEY(status) REFERENCES status(status_id)
);
INSERT INTO order_status VALUES(1, 3 );
INSERT INTO order_status VALUES(2, 3 );
INSERT INTO order_status VALUES(3, 3 );
INSERT INTO order_status VALUES(4, 2 );
INSERT INTO order_status VALUES(5, 1 );
INSERT INTO order_status VALUES(6, 3 );
INSERT INTO order_status VALUES(7, 3 );
INSERT INTO order_status VALUES(8, 3 );
INSERT INTO order_status VALUES(9, 1 );
INSERT INTO order_status VALUES(10, 2 );

CREATE TABLE invoice
(
  invoice_id INT PRIMARY KEY AUTO_INCREMENT,
  customer_id INT,
  order_id INT,
  FOREIGN KEY(customer_id) REFERENCES customer(customer_id) ON DELETE SET NULL,
  FOREIGN KEY(order_id) REFERENCES orders(order_id) ON DELETE SET NULL
);
INSERT INTO invoice VALUES(1, 1, 1);
INSERT INTO invoice VALUES(2, 2, 2);
INSERT INTO invoice VALUES(3, 3, 3);
INSERT INTO invoice VALUES(4, 4, 4);
INSERT INTO invoice VALUES(5, 5, 5);
INSERT INTO invoice VALUES(6, 6, 6);
INSERT INTO invoice VALUES(7, 7, 7);
INSERT INTO invoice VALUES(8, 8, 8);
INSERT INTO invoice VALUES(9, 9, 9);
INSERT INTO invoice VALUES(10, 10, 10);

CREATE TABLE invoice_price
(
  invoice_id INT PRIMARY KEY AUTO_INCREMENT,
  total_price INT
);
INSERT INTO invoice_price VALUES(1, 2);
INSERT INTO invoice_price VALUES(2, 5);
INSERT INTO invoice_price VALUES(3, 1500);
INSERT INTO invoice_price VALUES(4, 20);
INSERT INTO invoice_price VALUES(5, 20);
INSERT INTO invoice_price VALUES(6, 100);
INSERT INTO invoice_price VALUES(7, 10);
INSERT INTO invoice_price VALUES(8, 10);
INSERT INTO invoice_price VALUES(9, 100);
INSERT INTO invoice_price VALUES(10, 20);


CREATE TABLE pays
(
  payment_id INT PRIMARY KEY AUTO_INCREMENT,
  customer_id INT,
  order_id INT,
  FOREIGN KEY(customer_id) REFERENCES customer(customer_id) ON DELETE SET NULL,
  FOREIGN KEY(order_id) REFERENCES orders(order_id) ON DELETE SET NULL
);
INSERT INTO pays VALUES(1, 1, 1);
INSERT INTO pays VALUES(2, 2, 2);
INSERT INTO pays VALUES(3, 3, 3);
INSERT INTO pays VALUES(4, 4, 4);
INSERT INTO pays VALUES(5, 5, 5);
INSERT INTO pays VALUES(6, 6, 6);
INSERT INTO pays VALUES(7, 7, 7);
INSERT INTO pays VALUES(8, 8, 8);
INSERT INTO pays VALUES(9, 9, 9);
INSERT INTO pays VALUES(10, 10, 10);

CREATE TABLE pays_amount
(
  payment_id INT PRIMARY KEY AUTO_INCREMENT,
  amount INT
);
INSERT INTO pays_amount VALUES(1, 1);
INSERT INTO pays_amount VALUES(2, 1);
INSERT INTO pays_amount VALUES(3, 1);
INSERT INTO pays_amount VALUES(4, 1);
INSERT INTO pays_amount VALUES(5, 1);
INSERT INTO pays_amount VALUES(6, 1);
INSERT INTO pays_amount VALUES(7, 1);
INSERT INTO pays_amount VALUES(8, 1);
INSERT INTO pays_amount VALUES(9, 1);
INSERT INTO pays_amount VALUES(10, 1);


--VIEWS
--buff emp
CREATE VIEW Buffalo_Employees 
AS 
SELECT * 
FROM employee_branch
WHERE 
branch_id = 2

--managers
CREATE VIEW managers 
AS 
SELECT employee.employee_id, name, surname, birthday, phone, salary
FROM employee RIGHT JOIN employee_manager
ON employee.employee_id = employee_manager.manager_id;

--top customers
CREATE VIEW topCustomers 
AS 
SELECT * 
FROM customer
WHERE 
total_shopping > 20;

--delivered orders
CREATE VIEW deliveredOrders 
AS 
SELECT * 
FROM order_status
WHERE 
status = 3;

--books and stationery
CREATE VIEW booksAndStationery
AS
SELECT product_id, category, product.name, brand_name
FROM product 
LEFT JOIN category
ON product.category= category.category_id
WHERE (category.name= 'stationery' OR category.name= 'book' )
UNION
SELECT product_id, category, product.name, brand_name
FROM product 
RIGHT JOIN category
ON product.category= category.category_id
WHERE (category.name= 'stationery' OR category.name= 'book' );


--LEFT JOIN
--customers whose orders are 'on the way' 
SELECT * 
FROM customer
LEFT JOIN orders 
ON customer.customer_id = orders.customer_id
LEFT JOIN order_status 
ON orders.order_id = order_status.order_id
WHERE status= 2;


--RIGHT JOIN
--managers
SELECT * 
FROM employee
RIGHT JOIN employee_manager
ON employee.employee_id = employee_manager.manager_id;

--OUTER JOIN
--books and stationery
SELECT product_id, category, product.name, brand_name
FROM product 
LEFT JOIN category
ON product.category= category.category_id
WHERE (category.name= 'stationery' OR category.name= 'book' )
UNION
SELECT product_id, category, product.name, brand_name
FROM product 
RIGHT JOIN category
ON product.category= category.category_id
WHERE (category.name= 'stationery' OR category.name= 'book' );


--TRIGGERS

CREATE TABLE trigger_test 
(
  message VARCHAR(100)
);

--test
INSERT INTO employee VALUES(501, 'Amy', 'Plath', '1988-12-13', '742-900-9124', 63944);


--update employee
DELIMITER $$
CREATE
TRIGGER update_employee 
AFTER UPDATE
ON employee
FOR EACH ROW BEGIN
INSERT INTO trigger_test VALUES('An employee is updated int the database.' );
END$$
DELIMITER ;
--test
UPDATE employee 
SET salary = 64000
WHERE employee_id = 501;


--  quantity--
DELIMITER $$
CREATE
TRIGGER update_quantity 
AFTER UPDATE
ON product_quantity
FOR EACH ROW 
BEGIN 
INSERT INTO product_quantity SET product_id= old.product_id, quantity= old.quantity - 1;
END$$
DELIMITER ;


--update branch
DELIMITER $$
CREATE
TRIGGER add_branch
AFTER UPDATE
ON branch
FOR EACH ROW 
BEGIN 
IF 
new.name != old.name OR new.manager_id != old.manager_id
THEN
INSERT INTO branch SET name = old.name, manager_id= old.manager_id;
END IF;
END$$
DELIMITER ;

--UPDATED AFTER REPORT

--updated as 
--add employees
DELIMITER $$
CREATE
TRIGGER my_trigger 
AFTER INSERT
ON employee
FOR EACH ROW BEGIN
INSERT INTO trigger_test VALUES('A new employee is added to database.' );
END$$
DELIMITER ;


--trigger
--delete employee
DELIMITER $$
CREATE
TRIGGER delete_employee
AFTER DELETE
ON employee
FOR EACH ROW BEGIN
INSERT INTO trigger_test VALUES('An employee is deleted from database.' );
END$$
DELIMITER ;

DELETE FROM employee WHERE employee_id= 503;


--updated as
--increment total shopping
--create a new invoice

DELIMITER $$
CREATE
TRIGGER update_shopping 
AFTER INSERT
ON orders
FOR EACH ROW BEGIN
UPDATE customer SET total_shopping= total_shopping +1
WHERE customer_id= new.customer_id;

INSERT invoice(customer_id, order_id) values(new.customer_id, new.order_id);
END$$
DELIMITER ;