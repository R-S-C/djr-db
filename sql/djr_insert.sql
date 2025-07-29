INSERT INTO customer_accounts(f_name,l_name,phone_number,email) VALUES
	  ("Emily","Carter","5551234567","emily.carter@example.com"),
    ("James","Thornton","5559876543","james.thornton@email.net"),
    ("Sophia","Nguyen","5552468102","sophia.nguyen@sample.org"),
    ("Liam","Rodriguez","5553691470","liam.rodriguez@demo.co"),
    ("Ava","Bennet","5557890123","ava.bennett@testmail.com");
    
INSERT INTO employees(f_name,l_name,SIN,phone_number,email,role,pay_rate) VALUES
	  ("Noah","Mitchell","123456789","5553141592","noah.mitchell@fakemail.com","Technician","23"),
    ("Isabella","Flores","234567890","5552024040","isabella.flores@samplemail.org","Store Manager","35"),
    ("Ethan","Brooks","345678901","5558182727","ethan.brooks@mydemo.net","Inventory and Parts Manager","20"),
    ("Mia","Patel","456789012","5556460033","mia.patel@placeholder.co","Technician","23"),
    ("Alexander","Kim","567890123","5557771212","alex.kim@testaddress.com","Customer Service Representative","20");

UPDATE employees
SET total_hours = "6.5"
WHERE employee_id = 1;

UPDATE employees
SET total_hours = "5"
WHERE employee_id = 4;

UPDATE employees
SET role = "Branch Manager"
WHERE employee_id = 2;

INSERT INTO employees(f_name,l_name,SIN,phone_number,email,role,pay_rate) VALUES
	  ("John","Doe","987654321","5554443333","john.doe@notreal.com","Social Media Coordinator","20"),
    ("Jane","Smith","098765432","5556667777","jane_smith@email.net","Human Resources","23");

DELETE FROM employees
WHERE role = "Human Resources";

DELETE FROM employees
WHERE employee_id = 6;

INSERT INTO inventory_components(name,price,in_stock,category) VALUES
	  ("Intel Core i7 CPU","320.00","3","Processor"),
    ("AMD Ryzen 5 CPU","200.00","7","Processor"),
    ("NVIDIA GeForce RTX 3060","400.00","1","Graphics Card"),
    ("Samsung 970 EVO SSD","120.00","9","Storage(SSD)"),
    ("Western Digital HDD","60.00","2","Storage(HDD)"),
    ("Corsair Vengeance RAM","80.00","6","Memory"),
    ("Kingston 8GB DDR4 RAM","40.00","4","Memory"),
    ("Asus Motherboard","150.00","10","Motherboard"),
    ("Cooler Master CPU Fan","35.00","5","Cooling"),
    ("Logitech Wireless Mouse","25.00","8","Peripheral"),
    ("Dell Laptop Battery","80.00","2","Power Supply"),
    ("iPhone Battery","50.00","7","Power Supply"),
    ("Samsung Galaxy Display","90.00","1","Display"),
    ("USB-C Charging Cable","15.00","6","Cable/Connector"),
    ("SanDisk MicroSC Card","30.00","9","Storage"),
    ("Apple Lightning Cable","20.00","3","Cable/Connector"),
    ("Smartphone Screen Protector","10.00","4","Accessory"),
    ("External Hard Drive","100.00","10","Storage"),
    ("Smartphone Camera Lens","40.00","5","Camera Module"),
    ("Razer Mechanical Keyboard","110.00","8","Peripheral");

DELETE FROM inventory_components
WHERE component_id = 20;

DELETE FROM inventory_components
WHERE name = "Smartphone Camera Lens";
    
INSERT INTO repair_requests(request_date,customer_id,description) VALUES
	  ("2025-06-14",1,"I have a desktop PC that needs a new motherboard"),
    ("2025-07-08",2,"My iPhone's battery is dying very, very fast"),
    ("2025-07-08",3,"I want a screen protector for my phone"),
    ("2025-07-11",4,"My laptop won't turn on"),
    ("2025-07-19",5,"I would like to upgrade my PC's CPU");

INSERT INTO repair_jobs(status,start_date,estimated_completion_date,completion_date,description,work_hours,request_id) VALUES
	  ("Completed","2025-06-15","2025-06-18","2025-06-18","Desktop PC motherboard replacement",NULL,1),
    ("Completed","2025-07-09","2025-07-12","2025-07-12","iPhone battery replacement",NULL,2),
    ("Completed","2025-07-12","2025-07-13","2025-07-13","Smartphone screen protector installation",NULL,3),
    ("In Progress","2025-07-20","2025-07-27",NULL,"Laptop battery replacement",NULL,4),
    ("In Progress","2025-07-24","2025-07-31",NULL,"Desktop PC CPU upgrade, return the original to owner",NULL,5);

UPDATE repair_jobs
SET work_hours = "3.5"
WHERE job_id = 1;

UPDATE repair_jobs
SET work_hours = "3"
WHERE job_id = 2;

UPDATE repair_jobs
SET work_hours = "1"
WHERE job_id = 3;

UPDATE repair_jobs
SET work_hours = "3"
WHERE job_id = 4;

UPDATE repair_jobs
SET work_hours = "1"
WHERE job_id = 5;

INSERT INTO repair_tasks(work_hours,start_date,completion_date,job_id,component_id,employee_id) VALUES
	  (3.5,"2025-06-15","2025-06-18",1,8,1),
    (2,"2025-07-09","2025-07-10",2,12,1),
    (1,"2025-07-11","2025-07-12",2,12,4),
    (1,"2025-07-12","2025-07-13",3,17,4),
    (3,"2025-07-20",NULL,4,11,4),
    (1,"2025-07-24",NULL,5,1,1);

INSERT INTO invoices(invoice_total,status,description,job_id) VALUES
	  (230.50,"Paid in full","Replaced customer's motherboard with an Asus motherboard",1),
    (119.00,"Paid in full","Replaced the customer's iPhone battery",2),
    (33.00,"Payment pending","Installed a screen protector on the customer's smartphone",3);

CREATE VIEW service_technicians AS
SELECT CONCAT(f_name," ",l_name) AS "Service Technicians"
FROM employees
WHERE role = "Technician";

CREATE VIEW storage_solutions AS
SELECT name,price,in_stock
FROM inventory_components
WHERE category LIKE "Storage%";

ALTER VIEW service_technicians AS
SELECT CONCAT(f_name," ",l_name) AS "Service Tehnicians",email
FROM employees
WHERE role = "Technician";

ALTER VIEW storage_solutions AS
SELECT component_id,name,price,in_stock
FROM inventory_components
WHERE category LIKE "Storage%";
