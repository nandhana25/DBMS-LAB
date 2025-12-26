create database if not exists emp;
use emp;
CREATE TABLE dept1 (
  deptno INT PRIMARY KEY,
  dname VARCHAR(20),
  dloc VARCHAR(20)
);

CREATE TABLE project1 (
  pno INT PRIMARY KEY,
  pname VARCHAR(20),
  ploc VARCHAR(20)
);

CREATE TABLE employee (
  empno INT PRIMARY KEY,
  ename VARCHAR(20),
  mgrno INT,
  hiredate DATE,
  sal DECIMAL(10,2),
  deptno INT,
  FOREIGN KEY (deptno) REFERENCES dept1(deptno)
);

CREATE TABLE assigned_to (
  empno INT,
  pno INT,
  job_role VARCHAR(20),
  PRIMARY KEY (empno, pno),
  FOREIGN KEY (empno) REFERENCES employee(empno),
  FOREIGN KEY (pno) REFERENCES project1(pno)
);

CREATE TABLE incentives (
  incentive_date DATE,
  empno INT,
  incentive_amount DECIMAL(10,2),
  PRIMARY KEY (incentive_date, empno),
  FOREIGN KEY (empno) REFERENCES employee(empno)
);
INSERT INTO dept1 VALUES
(10,'HR','Bengaluru'),
(20,'Finance','Hyderabad'),
(30,'IT','Mysuru'),
(40,'Sales','Chennai'),
(50,'Marketing','Delhi'),
(60,'Admin','Pune');
select * from dept1;

INSERT INTO employee VALUES
(101,'Aarav',201,'2020-03-12',55000.00,10),
(102,'Bhavya',202,'2019-06-23',60000.00,20),
(103,'Chirag',203,'2021-01-10',48000.00,30),
(104,'Diya',204,'2021-11-05',75000.00,40),
(105,'Esha',205,'2022-07-15',50000.00,10),
(106,'Farhan',206,'2017-05-25',90000.00,30),
(107,'Gauri',207,'2019-09-01',68000.00,50),
(108,'Harsh',208,'2020-08-14',72000.00,60);
select * from employee;

INSERT INTO project1 VALUES
(501,'Payroll System','Bengaluru'),
(502,'Banking App','Hyderabad'),
(503,'Inventory','Mysuru'),
(504,'Sales Tracker','Chennai'),
(505,'AD Campaign','Delhi'),
(506,'ERP System','Pune');
select * from project1;

INSERT INTO assigned_to VALUES
(101,501,'Developer'),
(102,502,'Analyst'),
(103,503,'Tester'),
(104,504,'Manager'),
(105,505,'Support'),
(106,506,'Team Lead'),
(107,501,'Designer'),
(108,506,'Admin');
select * from assigned_to;

INSERT INTO incentives VALUES
('2023-01-15',101,3000.00),
('2023-02-10',102,4000.00),
('2023-03-05',104,2500.00),
('2023-04-01',106,5000.00),
('2023-05-20',107,3500.00);
select * from incentives;

SELECT DISTINCT a.empno FROM assigned_to a JOIN project1 p ON a.pno = p.pno WHERE p.ploc IN ('Bengaluru', 'Hyderabad', 'Mysuru');
SELECT empno FROM employee WHERE empno NOT IN (SELECT empno FROM incentives);
SELECT e.ename AS employee_name,e.empno AS employee_number,d.dname AS department_name,a.job_role AS job_role,d.dloc AS department_location,p.ploc AS project_location
FROM employee e JOIN dept1 d ON e.deptno = d.deptno JOIN assigned_to a ON e.empno = a.empno JOIN project1 p ON a.pno = p.pno WHERE d.dloc = p.ploc;




