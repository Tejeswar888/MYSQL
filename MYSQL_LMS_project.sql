DROP DATABASE IF EXISTS library_management;
CREATE DATABASE library_management;
USE library_management;

CREATE TABLE  IF NOT EXISTS LMS_MEMBERS
(
    MEMBER_ID VARCHAR(10) PRIMARY KEY,
    MEMBER_NAME VARCHAR(30),
    CITY VARCHAR(20),
    DATE_REGISTERED DATE,
    DATE_EXPIRE DATE,
    MEMBERSHIP_STATUS VARCHAR(15)
);

CREATE TABLE LMS_SUPPLIERS_DETAILS
(
    SUPPLIER_ID VARCHAR(10) PRIMARY KEY,
    SUPPLIER_NAME VARCHAR(30),
    ADDRESS VARCHAR(50),
    CONTACT VARCHAR(15),
    EMAIL VARCHAR(50)
);

CREATE TABLE LMS_FINE_DETAILS
(
    FINE_RANGE VARCHAR(20) PRIMARY KEY,
    FINE_AMOUNT DECIMAL(10,2)
);

CREATE TABLE LMS_BOOK_DETAILS
(
    BOOK_CODE VARCHAR(10) PRIMARY KEY,
    BOOK_TITLE VARCHAR(50),
    CATEGORY VARCHAR(15),
    AUTHOR VARCHAR(30),
    PUBLICATION VARCHAR(30),
    PUBLISH_DATE DATE,
    BOOK_EDITION INT,
    PRICE DECIMAL(10,2),
    RACK_NUM VARCHAR(10),
    DATE_ARRIVAL DATE,
    SUPPLIER_ID VARCHAR(10),
    FOREIGN KEY (SUPPLIER_ID)
    REFERENCES LMS_SUPPLIERS_DETAILS(SUPPLIER_ID)
);

CREATE TABLE LMS_BOOK_ISSUE
(
    BOOK_ISSUE_NO INT PRIMARY KEY,
    MEMBER_ID VARCHAR(10),
    BOOK_CODE VARCHAR(10),
    DATE_ISSUE DATE,
    DATE_RETURN DATE,
    DATE_RETURNED DATE,
    BOOK_ISSUE_STATUS VARCHAR(20),
    FINE_RANGE VARCHAR(20),
    FOREIGN KEY (MEMBER_ID)
    REFERENCES LMS_MEMBERS(MEMBER_ID),
    FOREIGN KEY (BOOK_CODE)
    REFERENCES LMS_BOOK_DETAILS(BOOK_CODE),
    FOREIGN KEY (FINE_RANGE)
    REFERENCES LMS_FINE_DETAILS(FINE_RANGE)
);

INSERT INTO LMS_MEMBERS
(MEMBER_ID, MEMBER_NAME, CITY, DATE_REGISTERED, DATE_EXPIRE, MEMBERSHIP_STATUS)
VALUES
('M001','Rahul','Hyderabad','2011-01-10','2014-01-10','Permanent'),
('M002','Teja','Tirupati','2011-02-15','2014-02-15','Permanent'),
('M003','Kiran','Chennai','2011-03-20','2013-03-20','Temporary'),
('M004','Arjun','Vijayawada','2012-01-05','2013-01-05','Temporary'),
('M005','Priya','Hyderabad','2012-02-10','2015-02-10','Permanent'),
('M006','Anil','Bangalore','2012-03-12','2015-03-12','Permanent'),
('M007','Suresh','Chennai','2011-04-18','2013-04-18','Temporary'),
('M008','Ravi','Tirupati','2011-05-20','2014-05-20','Permanent'),
('M009','Sai','Hyderabad','2012-04-15','2015-04-15','Permanent'),
('M010','Vamsi','Nellore','2011-06-11','2013-06-11','Temporary'),
('M011','Mahesh','Kadapa','2012-05-12','2015-05-12','Permanent'),
('M012','Rohit','Chittoor','2011-07-13','2013-07-13','Temporary'),
('M013','Naveen','Hyderabad','2012-06-14','2015-06-14','Permanent'),
('M014','Pavan','Bangalore','2011-08-15','2013-08-15','Temporary'),
('M015','Swathi','Chennai','2012-07-16','2015-07-16','Permanent'),
('M016','Deepak','Tirupati','2011-09-17','2013-09-17','Temporary'),
('M017','Harsha','Hyderabad','2012-08-18','2015-08-18','Permanent'),
('M018','Manoj','Vijayawada','2011-10-19','2013-10-19','Temporary'),
('M019','Lakshmi','Nellore','2012-09-20','2015-09-20','Permanent'),
('M020','Prasad','Kadapa','2011-11-21','2013-11-21','Temporary');

INSERT INTO LMS_SUPPLIERS_DETAILS
(SUPPLIER_ID, SUPPLIER_NAME, ADDRESS, CONTACT, EMAIL)
VALUES
('S001','ABC Books','Hyderabad','9000000001','abc@gmail.com'),
('S002','Prentice Hall','Chennai','9000000002','prentice@gmail.com'),
('S003','Pearson','Bangalore','9000000003','pearson@gmail.com'),
('S004','McGraw Hill','Hyderabad','9000000004','mcgraw@gmail.com'),
('S005','Oxford','Delhi','9000000005','oxford@gmail.com'),
('S006','Tech Books','Mumbai','9000000006','tech@gmail.com'),
('S007','Universal Books','Chennai','9000000007','universal@gmail.com'),
('S008','Knowledge House','Hyderabad','9000000008','knowledge@gmail.com'),
('S009','Student Books','Bangalore','9000000009','student@gmail.com'),
('S010','Digital Books','Delhi','9000000010','digital@gmail.com'),
('S011','Modern Books','Mumbai','9000000011','modern@gmail.com'),
('S012','National Books','Chennai','9000000012','national@gmail.com'),
('S013','Future Books','Hyderabad','9000000013','future@gmail.com'),
('S014','Classic Books','Bangalore','9000000014','classic@gmail.com'),
('S015','Smart Books','Delhi','9000000015','smart@gmail.com'),
('S016','Academic Books','Mumbai','9000000016','academic@gmail.com'),
('S017','Global Books','Chennai','9000000017','global@gmail.com'),
('S018','Prime Books','Hyderabad','9000000018','prime@gmail.com'),
('S019','Excel Books','Bangalore','9000000019','excel@gmail.com'),
('S020','Best Books','Delhi','9000000020','best@gmail.com');

INSERT INTO LMS_FINE_DETAILS
(FINE_RANGE, FINE_AMOUNT)
VALUES
('FINE1',10),
('FINE2',20),
('FINE3',30),
('FINE4',40),
('FINE5',50),
('FINE6',60),
('FINE7',70),
('FINE8',80),
('FINE9',90),
('FINE10',100),
('FINE11',110),
('FINE12',120),
('FINE13',130),
('FINE14',140),
('FINE15',150),
('FINE16',160),
('FINE17',170),
('FINE18',180),
('FINE19',190),
('FINE20',200);

INSERT INTO LMS_BOOK_DETAILS
(BOOK_CODE, BOOK_TITLE, CATEGORY, AUTHOR, PUBLICATION,
PUBLISH_DATE, BOOK_EDITION, PRICE, RACK_NUM,
DATE_ARRIVAL, SUPPLIER_ID)
VALUES
('BL000001','Python Programming','Python','Guido van Rossum','Prentice Hall','2010-01-10',1,500,'R01','2012-01-10','S002'),
('BL000002','Java Programming','Java','James Gosling','Prentice Hall','2010-02-10',2,600,'R02','2012-02-10','S002'),
('BL000003','Advanced Java','Java','Herbert Schildt','Pearson','2011-01-10',1,650,'R03','2012-03-10','S003'),
('BL000004','C Programming','C','Dennis Ritchie','McGraw Hill','2009-04-10',3,400,'R04','2012-04-10','S004'),
('BL000005','C++ Programming','C++','Bjarne Stroustrup','Pearson','2010-05-10',2,550,'R05','2012-05-10','S003'),
('BL000006','Database Systems','DBMS','Raghu Ramakrishnan','Prentice Hall','2011-06-10',1,700,'R06','2012-06-10','S002'),
('BL000007','Operating Systems','OS','Galvin','Prentice Hall','2010-07-10',4,750,'R07','2012-07-10','S002'),
('BL000008','Computer Networks','CN','Andrew Tanenbaum','Pearson','2011-08-10',3,800,'R08','2012-08-10','S003'),
('BL000009','Data Structures','DS','Seymour Lipschutz','McGraw Hill','2010-09-10',2,450,'R09','2012-09-10','S004'),
('BL000010','Artificial Intelligence','AI','Stuart Russell','Prentice Hall','2011-10-10',1,900,'R10','2012-10-10','S002'),
('BL000011','Machine Learning','ML','Tom Mitchell','Pearson','2012-01-10',1,850,'R11','2013-01-10','S003'),
('BL000012','Web Technology','Web','Jeffrey C Jackson','Oxford','2012-02-10',2,600,'R12','2013-02-10','S005'),
('BL000013','Software Engineering','SE','Pressman','Prentice Hall','2011-03-10',5,750,'R13','2013-03-10','S002'),
('BL000014','Computer Graphics','Graphics','Donald Hearn','Pearson','2010-04-10',3,700,'R14','2013-04-10','S003'),
('BL000015','Java Enterprise','Java','Herbert Schildt','Prentice Hall','2012-05-10',1,800,'R15','2013-05-10','S002'),
('BL000016','Java Complete Reference','Java','Herbert Schildt','Prentice Hall','2012-06-10',2,900,'R16','2013-06-10','S002'),
('BL000017','Cloud Computing','Cloud','Rajkumar Buyya','Pearson','2012-07-10',1,850,'R17','2013-07-10','S003'),
('BL000018','Computer Architecture','CA','Morris Mano','Prentice Hall','2011-08-10',4,650,'R18','2013-08-10','S002'),
('BL000019','Digital Electronics','DE','Morris Mano','McGraw Hill','2010-09-10',3,550,'R19','2013-09-10','S004'),
('BL000020','Java Basics','Java','Kathy Sierra','Prentice Hall','2012-10-10',1,500,'R20','2013-10-10','S002');

INSERT INTO LMS_BOOK_ISSUE
(BOOK_ISSUE_NO, MEMBER_ID, BOOK_CODE, DATE_ISSUE,
DATE_RETURN, DATE_RETURNED, BOOK_ISSUE_STATUS, FINE_RANGE)
VALUES
(1,'M001','BL000001','2012-01-15','2012-01-25','2012-01-25','Y','FINE1'),
(2,'M002','BL000002','2012-02-15',NULL,NULL,'N','FINE2'),
(3,'M003','BL000003','2012-03-15','2012-03-25','2012-03-25','Y','FINE3'),
(4,'M004','BL000004','2012-04-01','2012-04-11','2012-04-11','Y','FINE4'),
(5,'M005','BL000005','2012-05-15','2012-05-25','2012-05-25','Y','FINE5'),
(6,'M006','BL000006','2012-06-15',NULL,NULL,'N','FINE6'),
(7,'M007','BL000007','2012-07-15','2012-07-25','2012-07-25','Y','FINE7'),
(8,'M008','BL000008','2012-08-15',NULL,NULL,'N','FINE8'),
(9,'M009','BL000009','2012-09-15','2012-09-25','2012-09-25','Y','FINE9'),
(10,'M010','BL000010','2012-10-15',NULL,NULL,'N','FINE10'),
(11,'M011','BL000011','2012-11-15','2012-11-25','2012-11-25','Y','FINE11'),
(12,'M012','BL000012','2012-12-15',NULL,NULL,'N','FINE12'),
(13,'M013','BL000013','2013-01-15','2013-01-25','2013-01-25','Y','FINE13'),
(14,'M014','BL000014','2013-02-15',NULL,NULL,'N','FINE14'),
(15,'M015','BL000015','2013-03-15','2013-03-25','2013-03-25','Y','FINE15'),
(16,'M016','BL000016','2013-04-15',NULL,NULL,'N','FINE16'),
(17,'M017','BL000017','2013-05-15','2013-05-25','2013-05-25','Y','FINE17'),
(18,'M018','BL000018','2013-06-15',NULL,NULL,'N','FINE18'),
(19,'M019','BL000019','2013-07-15','2013-07-25','2013-07-25','Y','FINE19'),
(20,'M020','BL000020','2013-08-15',NULL,NULL,'N','FINE20');

SELECT * FROM LMS_MEMBERS;

SELECT * FROM LMS_SUPPLIERS_DETAILS;

SELECT * FROM LMS_FINE_DETAILS;

SELECT * FROM LMS_BOOK_DETAILS;

SELECT * FROM LMS_BOOK_ISSUE;

SELECT MEMBER_ID, MEMBER_NAME, CITY, MEMBERSHIP_STATUS
FROM LMS_MEMBERS
WHERE MEMBERSHIP_STATUS = 'Permanent';

SELECT M.MEMBER_ID, M.MEMBER_NAME
FROM LMS_MEMBERS M
JOIN LMS_BOOK_ISSUE I
ON M.MEMBER_ID = I.MEMBER_ID
WHERE I.BOOK_ISSUE_STATUS = 'N';

SELECT M.MEMBER_ID, M.MEMBER_NAME
FROM LMS_MEMBERS M
JOIN LMS_BOOK_ISSUE I
ON M.MEMBER_ID = I.MEMBER_ID
WHERE I.BOOK_CODE = 'BL000002';

SELECT BOOK_CODE, BOOK_TITLE, AUTHOR
FROM LMS_BOOK_DETAILS
WHERE AUTHOR LIKE 'P%';

SELECT COUNT(*) AS NO_OF_BOOKS
FROM LMS_BOOK_DETAILS
WHERE CATEGORY = 'Java';

SELECT CATEGORY, COUNT(*) AS NO_OF_BOOKS
FROM LMS_BOOK_DETAILS
GROUP BY CATEGORY;

SELECT COUNT(*) AS NO_OF_BOOKS
FROM LMS_BOOK_DETAILS
WHERE PUBLICATION = 'Prentice Hall';

SELECT D.BOOK_CODE, D.BOOK_TITLE
FROM LMS_BOOK_DETAILS D
JOIN LMS_BOOK_ISSUE I
ON D.BOOK_CODE = I.BOOK_CODE
WHERE I.DATE_ISSUE = '2012-04-01';

SELECT MEMBER_ID, MEMBER_NAME, DATE_REGISTERED, MEMBERSHIP_STATUS
FROM LMS_MEMBERS
WHERE DATE_REGISTERED < '2012-03-01'
AND MEMBERSHIP_STATUS = 'Temporary';

SELECT MEMBER_ID, MEMBER_NAME, DATE_REGISTERED, DATE_EXPIRE
FROM LMS_MEMBERS
WHERE DATE_EXPIRE < '2013-04-01';