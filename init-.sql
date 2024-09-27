CREATE DATABASE my_database;
DROP ROLE IF EXISTS JStormer;
CREATE ROLE JStormer WITH LOGIN SUPERUSER PASSWORD 'Could_you_guess_this_password_1234';
\c my_database
GRANT ALL PRIVILEGES ON DATABASE my_database TO JStormer;

CREATE SCHEMA IF NOT EXISTS company;

CREATE TABLE IF NOT EXISTS company.employees (
  employee_id SERIAL PRIMARY KEY,
  first_name VARCHAR(15),
  last_name VARCHAR(30),
  hire_date DATE,
  department_id integer NOT NULL
);

CREATE TABLE IF NOT EXISTS company.departments (
  department_id SERIAL PRIMARY KEY,
  department_name VARCHAR(40),
  building VARCHAR(60)
);

ALTER TABLE IF EXISTS company.employees
  ADD CONSTRAINT fk_department
  FOREIGN KEY (department_id)
  REFERENCES company.departments(department_id) MATCH SIMPLE
  ON UPDATE CASCADE
  ON DELETE NO ACTION;

CREATE VIEW company.get_user AS
SELECT employee.employee_id,
  employee.first_name || ' ' || employee.last_name as full_name,
  department.department_name,
  department.building
FROM company.employees AS employee JOIN company.departments as department
ON department.department_id = employee.department_id;