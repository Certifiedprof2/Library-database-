Library Management Database (SQL Project)
🔎 Project Overview
This project demonstrates the design and querying of a Library Management Database using SQL.
The system simulates how libraries manage books, members, and borrowing activities.
It covers:

Database creation

Schema design

Data insertion

Retrieval queries

Analytical insights using MySQL

❓ Problem Statement
Libraries manage large collections of books and must track which members borrow them and when they are returned.
Without a structured database, it becomes difficult to:

Track available books

Monitor borrowed books

Identify overdue loans

Manage member records

This project builds a relational database system to solve these problems using SQL.

🛠 Tools Used
MySQL Workbench

SQL

GitHub (for project documentation)

🗂 Database Schema Design
The database library_db contains three main tables:

Books Table
book_id (PK)

title

author

isbn

category

publication_year

copies_available

Members Table
member_id (PK)

first_name

last_name

email

phone

membership_date

Loans Table
loan_id (PK)

book_id (FK)

member_id (FK)

borrow_date

due_date

return_date

⚙️ Database Setup
sql
CREATE DATABASE library_db;
USE library_db;
SELECT DATABASE();
Books Table Creation
sql
CREATE TABLE books (
  book_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(150) NOT NULL,
  author VARCHAR(100) NOT NULL,
  isbn INT UNIQUE,
  category VARCHAR(50),
  publication_year YEAR,
  copies_available INT DEFAULT 1
);
Members Table Creation
sql
CREATE TABLE members (
  member_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE,
  phone VARCHAR(20),
  membership_date DATE DEFAULT CURRENT_DATE
);
Loans Table Creation
sql
CREATE TABLE loans (
  loan_id INT AUTO_INCREMENT PRIMARY KEY,
  book_id INT,
  member_id INT,
  borrow_date DATE NOT NULL,
  due_date DATE NOT NULL,
  return_date DATE
);
📊 Sample Query Examples
View all books

sql
SELECT * FROM books;
View registered members

sql
SELECT member_id, first_name, last_name FROM members;
Find loans on a specific date

sql
SELECT loan_id, book_id, member_id 
FROM loans 
WHERE borrow_date = '2026-03-07';
Books with more than 3 copies available

sql
SELECT book_id, title, author, copies_available 
FROM books 
WHERE copies_available > 3;
Books published after 2015

sql
SELECT book_id, title, author, publication_year 
FROM books 
WHERE publication_year > 2015;
Members who joined before 2022

sql
SELECT member_id, first_name, last_name, membership_date 
FROM members 
WHERE membership_date < '2022-01-01';
Loans not yet returned

sql
SELECT loan_id, book_id, member_id, borrow_date, due_date 
FROM loans 
WHERE return_date IS NULL;
✨ Features
Track book availability

Manage member records

Monitor overdue loans

Generate analytical insights with SQL queries

✅ Conclusion
This project demonstrates core SQL skills including:

Database creation

Schema design

Data insertion

Filtering & sorting

Analytical queries

It reflects how a basic library management database system operates in real-world scenarios.
