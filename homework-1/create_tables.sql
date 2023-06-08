-- SQL-команды для создания таблиц
create table customers
(
    customer_id char(5) PRIMARY KEY,
    company_name varchar(150),
    contact_name varchar(100)
);

create table employees
(
    employee_id int PRIMARY KEY,
    first_name varchar(100),
    last_name varchar(100),
    title varchar(100),
    birth_date date,
    notes text
);

create table orders
(
    order_id int PRIMARY KEY,
    customer_id char(5) REFERENCES customers,
    employee_id int REFERENCES employees,
    order_date date,
    ship_city varchar(100)
)

