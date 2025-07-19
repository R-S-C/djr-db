create database djr;

use djr;

create table customers(
	customer_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    f_name VARCHAR(50),
    l_name VARCHAR(50),
    customer_contact VARCHAR(50),
    phone_number INT(10),
    email VARCHAR(255)
);

create table repair_jobs(
	job_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    status VARCHAR(50),
    product_received_date DATE,
    start_date DATE,
    estimated_completion_date DATE,
    completion_date DATE,
    associated_customer_id INT,
    invoice_total DEC(10,2)
);

create table employees(
	employee_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    f_name VARCHAR(50),
    l_name VARCHAR(50),
    SIN INT(9),
    phone_number INT(10),
    email VARCHAR(255)
);

create table inventory_components(
	component_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(255),
    price DEC(10,2),
    in_stock VARCHAR(50)
);
