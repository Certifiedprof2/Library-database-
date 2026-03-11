/* DATABASE SETUP, */ 
-- Im creating a database Library_db for schema design --
CREATE DATABASE library_db;

/* im Verifying my connections to  ensure my database is active using the below command */
USE library_db;

/* i go further to see if my DATABASE is active */
SELECT DATABASE(); 

/* PHASE 2,  DATABASE TABLE AND SCHEMA DESIGN*/
-- BOOKS TABLE --
CREATE TABLE books (
book_id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(150) NOT NULL,
author VARCHAR(100) NOT NULL,
isbn INT(20) UNIQUE,
category VARCHAR(50),
pulication_year YEAR,
copies_available INT DEFAULT 1
);

/* inserting data into my table */
INSERT INTO books
(title, author, isbn, category, publication_year, copies_available)
VALUES
('Echoes of conspiracy', 'Williams John', '9780162350887', 'Business', 2000, 5),
('iron Cap', 'Adaji Ameh', '9480832350884', 'Languages', 2017, 25),
('Citizenship Education', 'Barrister Joseph','9780632450884', 'Environmental', 2012, 15),
('The Great Gatsby', 'F. Scott Fitzgerald', '9780743273565', 'Fiction', 1925, 5),
('To Kill a Mockingbird', 'Harper Lee', '9780061120084', 'Fiction', 1960, 3),
('Clean Code', 'Robert C. Martin', '9780132350884', 'Programming', 2008, 4);
 

/* CREATE MEMBERS TABLE */
CREATE TABLE members (
member_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) UNIQUE,
phone VARCHAR(20),
membership_date DATE DEFAULT (CURRENT_DATE)
);


/* inserting data into my table */
INSERT INTO members 
(first_name, last_name, email, phone, membership_date)
VALUES
('Ismaila', 'Aminu', 'ismaila12@gmail.com', '2348101753807', '2021-01-05'),
('ronke', 'Adam', 'ronke32@gmail.com', '2348108975387', '2021-08-05'),
('Joseph', 'Ndubuisi', 'ndubuisi22@gmail.com', '2349101753865', '2021-02-01'),
('Arron', 'Irabhor', 'aaron.irabor@gmail.com', '2347061171987', '2021-03-03'),
('Tunde', 'Abbas', 'abbastunde21@gmail.com', '2348030765432', '2021-01-05');


/* CREATE LOAN TABLE */
CREATE TABLE loans (
loans_id INT PRIMARY KEY AUTO_INCREMENT,
book_id INT,
member_id INT,
borrow_date DATE NOT NULL,
due_date DATE NOT NULL,
return_date date
);

/* inserting data into my table */
INSERT INTO loans
(loan_id, book_id, member_id, borrow_date, due_date, return_date)
VALUE
(1, 101, 2001, '2026-03-08', '2026-03-22', NULL),
(2, 102, 2002, '2026-03-07', '2026-03-21', '2026-03-10'),
(3, 103, 2003, '2026-03-08', '2026-03-22', NULL),
(4, 102, 2002, '2026-03-07', '2026-03-21', '2026-02-09'),
(5, 103, 2003, '2026-03-08', '2026-03-22', NULL);


/* after creating my tables i validate and inspect each tables with the command DESCRIBE to check the structure of the table */
-- DESCRIBE books, members, loans --

/* PHASE 3, extract and filtering data from my tables books, members, loan */
-- A says view all books --

SELECT * 
FROM books;

-- B says show all registerd members --
SELECT member_id, first_name, last_name
FROM members;

-- C says Find all loans made on a specific date --
SELECT loan_id, book_id, member_id
FROM loans
WHERE borrow_date = '2026-03-07';

-- D says Display all books with more than 3 available copies --
SELECT book_id, title, author, copies_available
FROM books
WHERE copies_available > 3;

/* PHASE 4 Use operators to build complex conditions and extract analytical insights */

-- A says Books published after 2015 --
SELECT book_id, title, author, publication_year
FROM books
WHERE publication_year > '2015';

-- B says Members who joined before 2022 --
SELECT member_id, first_name, last_name, membership_date
FROM members
WHERE membership_date < '2022-01-01';

-- C says Books that are either Fiction or Mystery --
SELECT book_id, title, author, category
FROM books
WHERE category = 'Fiction'
	OR category = 'Mystery';
 
-- D says Loans that have not been returned --
SELECT loan_id, book_id, member_id, borrow_date, due_date, return_date
FROM loans
WHERE return_date IS NULL;

-- E says Members who joined after 2020 and have borrowed books (bonus)
SELECT member_id, first_name, last_name
FROM members
WHERE membership_date > '2020';

/* PHASE 5 Organize, paginate, and refine your query results */
-- A says Sort all books alphabetically by title --

SELECT book_id, title, author, category, publication_year
FROM books
ORDER BY title ASC;

-- B says List distinct book genres --
SELECT DISTINCT(genre)
FROM books;

-- C says Get top 5 most recent members --
SELECT member_id, first_name, last_name, membership_date
FROM members
ORDER BY membership_date DESC
LIMIT 5;

-- D says Skip the first 5 books and display the next 5
SELECT *
FROM books
ORDER BY title ASC
LIMIT 5 OFFSET 5;

-- Show the 10 most recent loans not yet returned --
SELECT *
FROM loans
WHERE return_date IS NULL.
ORDER BY borrow_date ASC,
LIMIT 10;






