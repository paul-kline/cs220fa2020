DROP DATABASE IF EXISTS theoffice;
CREATE DATABASE theoffice;
USE theoffice;

DROP TABLE IF EXISTS products;
CREATE TABLE products(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    quantity MEDIUMINT NOT NULL CHECK (quantity>=0) 
);
INSERT INTO products(name, quantity) VALUES
("chair", 50),
("house", 100),
("horse",1000),
("pen", 43);


DROP TABLE IF EXISTS customers;
CREATE TABLE customers(
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL
);
INSERT INTO customers (first_name, last_name, address)
VALUES ("Nigel", "Johnson", '1500 Olive St.'),
        ("Lane", 'Jackson', 'Central Ave.'),
        ("John", 'Jones', 'Florida Dr.');

DROP TABLE IF EXISTS phone_numbers;
CREATE TABLE phone_numbers(
    customer_id INT,
    phone_number VARCHAR(20),
    priority TINYINT(1) unsigned NOT NULL DEFAULT 1,
    PRIMARY KEY (customer_id, phone_number),
    FOREIGN KEY (customer_id ) references customers (id)
);
insert into phone_numbers VALUES(3,"5444333224",1);
insert into phone_numbers (customer_id, phone_number, priority) 
values (2,"420-7734",2);
INSERT INTO phone_numbers(customer_id, phone_number, priority) 
VALUES(1,"456547665", 1);
/*
SQL constraints:
1. NOT NULL 
2. UNIQUE 
3. PRIMARY KEY 
4. FOREIGN KEY
5. CHECK()
6. DEFAULT

AUTO_INCREMENT
*/


drop table if exists lucas;
create table lucas(
    id int auto_increment,
    customer_id INT,
    phone_number VARCHAR(20),
    email VARCHAR(255),
    PRIMARY KEY (id),
    CONSTRAINT can_contact CHECK(!(isnull(phone_number) AND isnull(email)))
);
