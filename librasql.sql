--     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--        LibraSQL - Library Management System
--        Created by: Hitika Chhillar
--     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

CREATE DATABASE LibraSQL;
USE LibraSQL;

--     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--                  TABLES
--     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- Books Table
CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    author VARCHAR(100),
    genre VARCHAR(50),
    language VARCHAR(30),
    publication_year INT,
    total_copies INT
);

-- Members Table
CREATE TABLE members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    membership_type VARCHAR(20),
    join_date DATE
);

-- Issued Books Table
CREATE TABLE issued_books (
    issue_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    member_id INT,
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

--     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--                SAMPLE DATA
--     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

INSERT INTO books (title, author, genre, language, publication_year, total_copies) VALUES
('Harry Potter', 'J.K. Rowling', 'Fantasy', 'English', 1997, 7),
('It Ends With Us', 'Colleen Hoover', 'Romance', 'English', 2016, 6),
('Rich Dad Poor Dad', 'Robert Kiyosaki', 'Finance', 'English', 1997, 3),
('Wings of Fire', 'APJ Abdul Kalam', 'Biography', 'English', 1999, 5),
('Atomic Habits', 'James Clear', 'Self-Help', 'English', 2018, 4);

INSERT INTO members (name, email, phone, membership_type, join_date) VALUES
('Hitika Chhillar', 'hitika@gmail.com', '9876543210', 'Student', '2024-01-15'),
('Priya Verma', 'priya@gmail.com', '9988776655', 'Student', '2024-02-10'),
('Rahul Sharma', 'rahul@gmail.com', '9123456780', 'Regular', '2024-03-05'),
('Anjali Singh', 'anjali@gmail.com', '9871234560', 'Teacher', '2024-01-20');

INSERT INTO issued_books (book_id, member_id, issue_date, return_date) VALUES
(1, 1, '2024-04-01', '2024-04-15'),
(2, 2, '2024-04-05', NULL),
(3, 3, '2024-04-10', NULL),
(4, 1, '2024-04-12', '2024-04-25'),
(5, 4, '2024-04-15', NULL);

SELECT * FROM books;
SELECT * FROM members;
SELECT * FROM issued_books;

