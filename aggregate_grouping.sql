
-- 1. Count total books
SELECT COUNT(*) AS Total_Books FROM Books;

-- 2. Count books by genre
SELECT Genre, COUNT(*) AS Total_Books
FROM Books
GROUP BY Genre;

-- 3. Average published year by genre
SELECT Genre, AVG(PublishedYear) AS Avg_Year
FROM Books
GROUP BY Genre;

-- 4. Number of books per author
SELECT Authors.Name, COUNT(Books.BookID) AS Books_Written
FROM Authors
JOIN Books ON Authors.AuthorID = Books.AuthorID
GROUP BY Authors.Name;

-- 5. Members who borrowed more than 1 book
SELECT Members.Name, COUNT(Borrowing.BorrowID) AS Total_Borrows
FROM Members
JOIN Borrowing ON Members.MemberID = Borrowing.MemberID
GROUP BY Members.Name
HAVING COUNT(Borrowing.BorrowID) > 1;

-- 6. Sum of books borrowed by each member
SELECT Members.Name, SUM(1) AS Total_Books_Borrowed
FROM Members
JOIN Borrowing ON Members.MemberID = Borrowing.MemberID
GROUP BY Members.Name;

-- 7. Highest published year per genre
SELECT Genre, MAX(PublishedYear) AS Latest_Year
FROM Books
GROUP BY Genre;

-- 8. Count distinct genres
SELECT COUNT(DISTINCT Genre) AS Unique_Genres
FROM Books;

-- 9. Rounded average published year
SELECT Genre, ROUND(AVG(PublishedYear), 0) AS Rounded_Avg_Year
FROM Books
GROUP BY Genre;

-- 10. Authors with more than 2 books
SELECT Authors.Name, COUNT(Books.BookID) AS Books_Written
FROM Authors
JOIN Books ON Authors.AuthorID = Books.AuthorID
GROUP BY Authors.Name
HAVING COUNT(Books.BookID) > 2;
