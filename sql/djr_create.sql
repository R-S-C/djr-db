create database djr;

use djr;

create table customer_accounts(
	customer_id INT AUTO_INCREMENT NOT NULL,
    f_name VARCHAR(50),
    l_name VARCHAR(50),
    phone_number CHAR(10), -- could add a CHECK here to make sure it's a valid number rather than CHAR limit
    email VARCHAR(255), -- could add a CHECK here to make sure it's a valid email using regex
    amount_owing DEC(10,2) DEFAULT 0.00,
    PRIMARY KEY (customer_id)
);

create table repair_requests(
	request_id INT AUTO_INCREMENT NOT NULL,
    request_date DATE NOT NULL, -- tried to find a way to have the DEFAULT value be the current date but can't find a way to do that without adding the time
    customer_id INT NOT NULL,
    description VARCHAR(4000),
    PRIMARY KEY (request_id),
    FOREIGN KEY (customer_id) REFERENCES customer_accounts(customer_id)
		On DELETE CASCADE
        ON UPDATE CASCADE
);

create table repair_jobs(
	job_id INT AUTO_INCREMENT NOT NULL,
    status VARCHAR(255),
    start_date DATE NOT NULL,
    estimated_completion_date DATE,
    completion_date DATE,
    description VARCHAR(4000),
    work_hours DEC(10,2) DEFAULT 0.0,
    request_id INT NOT NULL,
    PRIMARY KEY (job_id),
    FOREIGN KEY (request_id) REFERENCES repair_requests(request_id)
		On DELETE CASCADE
        ON UPDATE CASCADE
);

create table employees(
	employee_id INT AUTO_INCREMENT NOT NULL,
    f_name VARCHAR(50),
    l_name VARCHAR(50),
    SIN CHAR(9),
    phone_number CHAR(10),
    email VARCHAR(255),
    role VARCHAR(255),
    total_hours DEC(10,2) DEFAULT 0.0,
    pay_rate DEC(10,2),
    PRIMARY KEY (employee_id)
);

create table inventory_components(
	component_id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(255),
    price DEC(10,2) NOT NULL,
    in_stock INT,
    category VARCHAR(255),
    PRIMARY KEY (component_id)
);

create table repair_tasks(
	task_id INT AUTO_INCREMENT NOT NULL,
    work_hours DEC(10,2),
    start_date DATE,
    completion_date DATE,
    job_id INT NOT NULL,
    component_id INT,
    employee_id INT,
    PRIMARY KEY (task_id),
    FOREIGN KEY (job_id) REFERENCES repair_jobs(job_id)
		On DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (component_id) REFERENCES inventory_components(component_id)
		On DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
		On DELETE CASCADE
        ON UPDATE CASCADE
);

create table invoices(
	invoice_id INT AUTO_INCREMENT NOT NULL,
    invoice_total DEC(10,2), -- would be cool to have this UPDATE as repair_tasks are created
    status VARCHAR(255),
    description VARCHAR(4000),
    job_id INT NOT NULL,
    PRIMARY KEY (invoice_id),
    FOREIGN KEY (job_id) REFERENCES repair_jobs(job_id)
		On DELETE CASCADE
        ON UPDATE CASCADE
);
