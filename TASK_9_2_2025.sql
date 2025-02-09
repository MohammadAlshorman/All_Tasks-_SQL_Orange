
CREATE DATABASE Library;

CREATE TABLE Books (
BookID INT PRIMARY KEY , 
Title VARCHAR (30) NOT NULL ,
AuthorID INT NOT NULL ,
PublishedYear INT NOT NULL ,
CopiesAvailable INT NOT NULL , /*SQL غير موجود في  YEAR,  YEAR  ما زبطت*/ 
BookCategory VARCHAR (30) NOT NULL

);


CREATE TABLE Authors (
AuthorID INT PRIMARY KEY, 
FirstName VARCHAR (30) NOT NULL ,
LastName VARCHAR (30) NOT NULL ,
BirthYear INT NOT NULL /*SQL غير موجود في  YEAR,  YEAR  ما زبطت*/
);

/*-------------------------------------------------------------------------------*/

/* 1- insert 5 rows in each table  */

/*             BOOKS TABLE INSERT           */
INSERT INTO Books (BookID, Title, AuthorID, PublishedYear, CopiesAvailable, BookCategory)
VALUES
(1, 'M7MD', 1, 2002 , 200, 'policy'),
(2, 'M7MD', 1, 2002 , 200, 'policy'),
(3, 'M7MD', 1, 2002 , 200, 'policy'),
(4, 'M7MD', 1, 2002 , 200, 'policy'),
(5, 'M7MD', 1, 2002 , 200, 'policy');

/*             Authors TABLE INSERT           */
INSERT INTO Authors (AuthorID , FirstName, LastName,BirthYear)
VALUES
(1, 'M7MD', 'ALSHRMAN', 2002),
(2, 'M7MD', 'ALSHRMAN', 2002),
(3, 'M7MD', 'ALSHRMAN', 2002),
(4, 'M7MD', 'ALSHRMAN', 2002),
(5, 'M7MD', 'ALSHRMAN', 2002);

/*-------------------------------------------------------------------------------*/


/* 2- Display All Books and Authors: ( Query to retrieve and print details of all books along with their respective authors).*/

 Select * From Books;
  Select * From Authors;

/*-------------------------------------------------------------------------------*/

/*3-  Book Availability: ( Query to show the book with the highest and lowest number of available copies )*/

 Select Title, CopiesAvailable
 From Books
 Where CopiesAvailable =(Select MAX(CopiesAvailable) From Books )
 or CopiesAvailable = (Select MIN (CopiesAvailable) From Books );

 /*-------------------------------------------------------------------------------*/

 /*4- Average Publication Year:( Query to calculate and display the average publication year of books in the library )*/

SELECT AVG(PublishedYear) AS AveragePublicationYear FROM Books;

 /*-------------------------------------------------------------------------------*/

 /*5- Total Books Count:( Query to count and print the total number of books in the library )*/
 SELECT COUNT(*) AS TotalBooks FROM Books;

 /*-------------------------------------------------------------------------------*/

 /*6- Empty Books Table ( i just need make Books Table with out any record )*/
 truncate table Books;

  /*-------------------------------------------------------------------------------*/

 /*7- update Authors table ( Query to add Email & Phone_Number as new columns )*/
 ALTER TABLE Authors
ADD Email VARCHAR(100), Phone_Number VARCHAR(15);

 /*-------------------------------------------------------------------------------*/

 /*8- Delete Authors Table)*/
DROP TABLE Authors;
