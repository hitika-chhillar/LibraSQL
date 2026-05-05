--        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--         LibraSQL - Practice Queries
--         Created by: Hitika Chhillar
--        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

USE LibraSQL;

--        ~~~~~~~~~~~~~~~~~~~~
--           BASIC QUERIES
--        ~~~~~~~~~~~~~~~~~~~~

-- 1. Saari books dekho
          SELECT * FROM books;
-- 2. Saare members dekho
          SELECT * FROM members;
-- 3. Sirf title aur author dekho
          SELECT title,author FROM books;
-- 4. Self-Help genre ki books
		  SELECT * 
          FROM books 
          WHERE genre = 'Self-Help';
-- 5. 2000 ke baad publish hui books
		  SELECT * 
          FROM books
          WHERE publication_year > 2000;
-- 6. Kitne total members hain
		  SELECT * FROM members;
-- 7. Alphabetical order mein books
		 SELECT * 
         FROM books
         ORDER BY title ASC;
         
--     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--           INTERMEDIATE QUERIES
--     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- 8. Abhi kaun si books issued hain
    SELECT * 
    FROM issued_books
    WHERE return_date is null;
-- 9. Sabse zyada copies wali book
    SELECT * 
    FROM BOOKS
    ORDER BY total_copies DESC
    LIMIT 1;
-- 10. Sabse purani book
    SELECT *
    FROM BOOKS
    WHERE publication_year = (
    SELECT min(publication_year)from books
    );
-- 11. Student members kaun hain
     SELECT *
     FROM members
     WHERE membership_type = 'Student';
-- 12. Har genre mein kitni books hain
      SELECT genre, 
      COUNT(*) AS total_books
      FROM books 
      GROUP BY genre;
-- 13. Jin members ke naam H se shuru hote hain
        SELECT *
        FROM members
        WHERE name LIKE 'H%';
-- 14. Kisne kaunsi book li hai
        SELECT m.name, b.title, i.issue_date, i.return_date
        FROM issued_books i
        JOIN members m on i.member_id = m.member_id
        JOIN books b on i.book_id = b.book_id;
        
-- 15. Kaun si books abhi bhi wapas nahi aayi
         SELECT m.name, b.title, i.issue_date
         FROM issued_books i
         JOIN members m ON i.member_id = m.member_id
         JOIN books b ON i.book_id = b.book_id
         WHERE i.return_date is NULL;