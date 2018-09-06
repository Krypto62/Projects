USE MASTER 
GO
CREATE DATABASE Library;
GO
USE Library;

-- Create a table named "LIBRARY_BRANCH"
CREATE TABLE "LIBRARY_BRANCH" (
	"BranchID" INT NOT NULL,
	"BranchName" VARCHAR(50),
	"Address" VARCHAR(50),
	PRIMARY KEY ("BranchID")
);

-- Create a table named "PUBLISHER"
CREATE TABLE "PUBLISHER" (
"PublisherName" VARCHAR(30) NOT NULL,
"Address" VARCHAR(50),
"Phone" VARCHAR(25),
PRIMARY KEY (PublisherName)
);

-- Create a table named "BOOKS"
CREATE TABLE "BOOKS" (
"BookID" VARCHAR(30) NOT NULL,
"Title" VARCHAR(30),
"PublisherName" VARCHAR(30),
PRIMARY KEY (BookID),
FOREIGN KEY (PublisherName) REFERENCES PUBLISHER (PublisherName)
);

-- Create a table named "BOOK_AUTHORS”
CREATE TABLE "BOOK_AUTHORS" (
	"AuthorName" VARCHAR(30) NOT NULL,
	"BookID" VARCHAR(30),
	-- PRIMARY KEY (AuthorName),
	FOREIGN KEY (BookID) REFERENCES BOOKS (BookID)  
);

-- Create a table named "BOOK_COPIES"
CREATE TABLE "BOOK_COPIES" (
	"ItemID" INT NOT NULL IDENTITY (1,1),
	"Number_Of_Copies" INT,
	"BookID" VARCHAR(30),
	"BranchID" INT,
	PRIMARY KEY (ItemID),
	FOREIGN KEY (BookID) REFERENCES BOOKS (BookID),
	FOREIGN KEY (BranchID) REFERENCES LIBRARY_BRANCH (BranchID)
);


-- Create a table named "BORROWER"
CREATE TABLE "BORROWER" (
"CardNo" VARCHAR(30),
"Name" VARCHAR(30),
"Address" VARCHAR(50),
"Phone" VARCHAR(25),
PRIMARY KEY (CardNo)
);

-- Create a table named "BOOK_LOANS"
CREATE TABLE "BOOK_LOANS" (
"LoanID" INT NOT NULL IDENTITY (1,1),
"BookID" VARCHAR(30),
"BranchID" INT,
"CardNo" VARCHAR(30),
"DateOut" DATE, 
"DateDue" DATE,
PRIMARY KEY (LoanID),
FOREIGN KEY (BookID) REFERENCES BOOKS (BookID),
FOREIGN KEY (BranchID) REFERENCES LIBRARY_BRANCH (BranchID), 
FOREIGN KEY (CardNo) REFERENCES BORROWER (CardNo)
);

-- Populate the LIBRARY_BRANCH table
INSERT INTO LIBRARY_BRANCH (BranchID, BranchName, Address)
VALUES (1,'Sharpstown', '123 SW First'),
(2, 'Central', '345 SE Second')
(3,'Ashbury', '678 NE Haight Street'),
(4, 'Sotheby', '91011 NW English Ave')
;

-- See what's in the Library_Branch table
SELECT * FROM LIBRARY_BRANCH;

-- Populate the PUBLISHER table
INSERT INTO PUBLISHER (PublisherName, Address, Phone)
VALUES ('Ace Books', 'ABC Casino Avenue', '503-111-9999'),
('Applewood Books', 'Dead Tree Boulevard', '503-222-8888'),
('Avery Publishing', '543 HolePunch Street', '503-333-7777'),
('Ballantine Books', '7654 Bouncyball Ave', '503-444-6666'),
('Doubleday', '111 Triple Court', '503-555-5555')
;

-- Verify PUBLISHIER table is populated
SELECT * FROM PUBLISHER;

-- Populate the BOOKS table
INSERT INTO BOOKS (BookID, Title, PublisherName)
VALUES ('b1', 'Pride and Prejudice', 'Ace Books'),
('b2', 'Beowulf', 'Ace Books'),
('b3', 'Adventures in Wonderland', 'Ace Books'),
('b4', 'Moby Dick', 'Ace Books')
;

-- Verify BOOKS table is populated correctly
SELECT * FROM BOOKS;

-- Populate more into the BOOKS table
INSERT INTO BOOKS (BookID, Title, PublisherName)
VALUES 
('b5', 'The Romance of Lust', 'Ace Books'),
('b6', 'Calculus Made Easy', 'Ace Books'),
('b7', 'Advent. of Sherlock Holmes', 'Ace Books'),
('b8', 'Frankenstein', 'Ace Books'),
('b9', 'The Iliad', 'Ace Books'),
('b10', 'Heart of Darkness', 'Ace Books'),
('b11', 'A Tale of Two Cities', 'Ace Books'),
('b12', 'Advent. of Tom Sawyer', 'Applewood Books'),
('b13', 'Grimms Fairy Tales', 'Applewood Books'),
('b14', 'Crimes of Preachers', 'Applewood Books'),
('b15', 'My Fathers Dragon', 'Applewood Books'),
('b16', 'Dracula', 'Applewood Books'),
('b17', 'The Count of Monte Cristo', 'Applewood Books'),
('b18', 'The Republic', 'Applewood Books'),
('b19', 'The Brothers Karamazov', 'Avery Publishing'),
('b20', 'Advent. of Huckleberry Finn', 'Avery Publishing'),
('b21', 'Importance of Being Earnest', 'Avery Publishing'),
('b22', 'Treasure Island', 'Avery Publishing'),
('b23', 'Jane Eyre', 'Avery Publishing'),
('b24', 'Emma', 'Avery Publishing'),
('b25', 'Ulysses', 'Avery Publishing'),
('b26', 'Picture of Dorian Gray', 'Avery Publishing'),
('b27', 'Life of Frederick Douglass', 'Avery Publishing'),
('b28', 'Bess of the Woods', 'Avery Publishing'),
('b29', 'Daughters of Nijo', 'Avery Publishing'),
('b30', 'Narrative of Captivity', 'Avery Publishing'),
('b31', 'The Kama Sutra', 'Avery Publishing'),
('b32', 'Et dukkehjem', 'Avery Publishing'),
('b33', 'My Secret Life', 'Avery Publishing'),
('b34', 'Andalusian Knitting', 'Avery Publishing'),
('b35', 'Theism and Humanism', 'Avery Publishing'),
('b36', 'Dr. Jekyll and Mr. Hyde', 'Avery Publishing'),
('b37', 'Anne of Green Gables', 'Avery Publishing'),
('b38', 'Vom sterbenden Rokoko', 'Ballantine Books'),
('b39', 'Dubliners', 'Ballantine Books'),
('b40', 'Leviathan', 'Ballantine Books'),
('b41', 'A Study in Scarlet', 'Ballantine Books'),
('b42', 'Peter Pan', 'Ballantine Books'),
('b43', 'Prestuplenie', 'Doubleday'),
('b44', 'The Federalist Papers', 'Doubleday'),
('b45', 'Siddhartha', 'Doubleday'),
('b46', 'A Christmas Carol', 'Doubleday'),
('b47', 'The Lost Tribe', 'Doubleday'),
('b48', 'Pet Sematary', 'Doubleday'),
('b49', 'Carrie', 'Doubleday'),
('b50', 'The Outsider', 'Doubleday')
;

-- Verify BOOKS table is populated correctly
SELECT * FROM BOOKS;


INSERT INTO BOOK_AUTHORS (BookID, AuthorName)
VALUES ('b1', 'Jane Austen'),
('b2', 'Anglo-Saxon Poem'),
('b3', 'Lewis Carroll'),
('b4', 'Herman Melville')
;

-- Verify BOOK_AUTHORS table is populated correctly
SELECT * FROM BOOK_AUTHORS;

-- Populate the BOOK_AUTHORS table
INSERT INTO BOOK_AUTHORS (BookID, AuthorName)
VALUES ('b5', 'Anonymous'),
('b6', 'Silvanus P. Thompson'),
('b7', 'Arthur Conan Doyle'),
('b8', 'Mary W. Shelley'),
('b9', 'Homer'),
('b10', 'Joseph Conrad'),
('b11', 'Charles Dickens'),
('b12', 'Mark Twain'),
('b13', 'Jacob Grimm'),
('b14', 'M. E. Billings'),
('b15', 'Ruth Stiles Gannett'),
('b16', 'Bram Stoker'),
('b17', 'Alexandre Dumas'),
('b18', 'Plato'),
('b19', 'Fyodor Dostoyevsky'),
('b20', 'Mark Twain'),
('b21', 'Oscar Wilde'),
('b22', 'Robert Louis Stevenson'),
('b23', 'Charlotte Brontë'),
('b24', 'Jane Austen'),
('b25', 'James Joyce'),
('b26', 'Oscar Wilde'),
('b27', 'Frederick Douglass'),
('b28', 'Warwick Deeping'),
('b29', 'Winnifred Eaton'),
('b30', 'Mary White Rowlandson'),
('b31', 'Vatsyayana'),
('b32', 'Henrik Ibsen'),
('b33', 'Anonymous'),
('b34', 'Eléonore Riego'),
('b35', 'Arthur James Balfour'),
('b36', 'Robert Louis Stevenson'),
('b37', 'L. M. Montgomery'),
('b38', 'Rudolf Hans Bartsch'),
('b39', 'James Joyce'),
('b40', 'Thomas Hobbes'),
('b41', 'Arthur Conan Doyle'),
('b42', 'J. M. Barrie'),
('b43', 'Fyodor Dostoyevsky'),
('b44', 'Alexander Hamilton'),
('b45', 'Hermann Hesse'),
('b46', 'Charles Dickens'),
('b47', 'Mark Lee'),
('b48', 'Stephen King'),
('b49', 'Stephen King'),
('b50', 'Stephen King')
;

-- See the names of Library Branches
Select * from LIBRARY_BRANCH


-- Test to see if insert statement correct
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_Of_Copies)
VALUES ('b1', 2, 6),
('b1', 1, 5),
('b1', 3, 3),
('b1', 4, 5);

-- select * from book_copies;

INSERT INTO BOOK_COPIES (BookID, BranchID, Number_Of_Copies)
VALUES
('b2', 1, 5),
('b3', 1, 8),
('b4', 2,5),
('b5', 4,3),
('b6', 3, 7),
('b7', 4,5),
('b8', 4,5),
('b9', 3,9),
('b10', 2,6),
('b11', 2,2),
('b12', 1,4),
('b13', 1,4),
('b14', 1,6),
('b15', 4,9),
('b16', 2,4),
('b17', 2,3),
('b18', 4,4),
('b19', 1,3),
('b20', 2,8),
('b21', 3,4),
('b21', 2,4),
('b21', 1,6),
('b22', 2,4),
('b23', 4,2),
('b24', 2,6),
('b25', 2,4),
('b26', 1,6),
('b27', 4,2),
('b28', 1,8),
('b29', 3,2),
('b30', 4,5),
('b31', 3,4),
('b32', 1,7),
('b33', 2,4),
('b34', 3,4),
('b35', 1,7),
('b36', 1,4),
('b37', 2,5),
('b38', 3,7),
('b39', 2,5),
('b40', 4,5),
('b41', 4,3),
('b42', 4,7),
('b43', 3,7),
('b44', 2,6),
('b45', 1,3),
('b46', 1,4),
('b47', 2, 12),
('b48', 2, 5),
('b49', 3, 5),
('b50', 4, 7)
;

-- Make sure "The Lost Tribe is in more than one Branch
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_Of_Copies)
VALUES ('b47', 1, 4),
('b47', 3, 6),
('b47', 4, 5)
;

-- Verify insert worked correctly
select * from book_copies;


-- Populate BORROWER table with borrowers
INSERT INTO BORROWER (CardNo, Name, Address, Phone)
VALUES ('Smith12123', 'Susan Smith', '123 Summerset Lane', '503-333-4445'),
('Fowle44552', 'Ricky Fowler', '456 Golfer Lane', '503-548-7754'),
('Forem12123', 'George Foreman', '12 Boxer Circle', '503-668-5512'),
('Conwa98338', 'Kim Conway', '123 Summerset Lane', '503-112-4477'),
('Guthr88991', 'Arlo Guthree', ' 32 South Guitar Lane', '503-303-4550'),
('Melee76739', 'Pele Melee', 'NE Soccer  Ave', '503-883-4142'),
('Curre71177', 'Steph Currey', '16 Laker Circle', '971-123-6144'),
('Jacob92993', 'Jill Jacob', '111 Who Knows Way', '503-399-4840'),
('Brown12006', 'Charlie Brown', '424 Peanuts Blvd', '503-666-8888')
;

select * from BORROWER;

INSERT INTO  BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue)
VALUES ('b44', 1, 'Smith12123', '2018-06-25', '2018-07-25'),
('b14', 1, 'Smith12123', '2018-06-12', '2018-07-12'),
('b37', 2, 'Smith12123', '2018-07-12', '2018-08-12'),
('b15', 4, 'Smith12123', '2018-08-01', '2018-09-01'),
('b4', 2, 'Smith12123', '2018-07-12', '2018-08-12'),
('b1', 1, 'Fowle44552', '2018-08-08', '2018-09-08'),
('b26', 1, 'Fowle44552', '2018-08-18', '2018-09-08'),
('b28', 1, 'Fowle44552', '2018-08-18', '2018-09-08'),
('b12', 1, 'Fowle44552', '2018-08-18', '2018-09-08'),
('b13', 1, 'Fowle44552', '2018-08-18', '2018-09-08'),
('b38', 3, 'Jacob92993', '2018-08-25', '2018-09-25'),
('b43', 3, 'Jacob92993', '2018-08-25', '2018-09-25'),
('b41', 4, 'Guthr88991', '2018-08-27', '2018-09-27'),
('b42', 4, 'Guthr88991', '2018-08-27', '2018-09-27'),
('b38', 3, 'Conwa98338', '2018-06-12', '2018-07-12'),
('b44', 1, 'Melee76739', '2018-06-18', '2018-07-18'),
('b14', 1, 'Forem12123', '2018-06-12', '2018-07-12'),
('b37', 2, 'Forem12123', '2018-07-12', '2018-08-12'),
('b15', 4, 'Forem12123', '2018-08-01', '2018-09-01'),
('b4', 2, 'Melee76739', '2018-07-12', '2018-08-12'),
('b1', 1, 'Forem12123', '2018-09-08', '2018-09-08'),
('b26', 1, 'Melee76739', '2018-08-08', '2018-09-08'),
('b28', 1, 'Forem12123', '2018-08-08', '2018-09-08'),
('b12', 1, 'Melee76739', '2018-08-08', '2018-09-08'),
('b13', 1, 'Melee76739', '2018-08-08', '2018-09-08'),
('b38', 3, 'Forem12123', '2018-08-25', '2018-09-25'),
('b43', 3, 'Melee76739', '2018-08-25', '2018-09-25'),
('b41', 4, 'Melee76739', '2018-08-27', '2018-09-27'),
('b42', 4, 'Melee76739', '2018-08-27', '2018-09-27'),
('b38', 3, 'Forem12123', '2018-06-12', '2018-07-12')
;

INSERT INTO  BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue)
VALUES ('b44', 1, 'Curre71177', '2018-08-03', '2018-09-03'),
('b14', 1, 'Curre71177', '2018-08-03', '2018-09-03'),
('b37', 2, 'Curre71177', '2018-08-03', '2018-09-03'),
('b15', 4, 'Curre71177', '2018-08-03', '2018-09-03'),
('b4', 2, 'Curre71177', '2018-08-03', '2018-09-03'),
('b1', 1, 'Curre71177', '2018-08-03', '2018-09-03'),
('b26', 1, 'Curre71177', '2018-08-03', '2018-09-03'),
('b28', 1, 'Curre71177', '2018-08-03', '2018-09-03'),
('b12', 1, 'Curre71177', '2018-08-03', '2018-09-03'),
('b13', 1, 'Curre71177', '2018-08-03', '2018-09-03'),
('b11', 2, 'Jacob92993', '2018-08-25', '2018-09-25'),
('b12', 1, 'Jacob92993', '2018-08-25', '2018-09-25'),
('b24', 2, 'Guthr88991', '2018-08-27', '2018-09-27'),
('b25', 2, 'Guthr88991', '2018-08-27', '2018-09-27'),
('b26', 1, 'Conwa98338', '2018-06-12', '2018-07-12'),
('b27', 4, 'Melee76739', '2018-06-18', '2018-07-18'),
('b34', 3, 'Forem12123', '2018-06-12', '2018-07-12'),
('b35', 1, 'Forem12123', '2018-07-12', '2018-08-12'),
('b36', 1, 'Forem12123', '2018-08-01', '2018-09-01'),
('b44', 2, 'Melee76739', '2018-07-12', '2018-08-12'),
('b45', 1, 'Forem12123', '2018-08-08', '2018-09-08'),
('b46', 1, 'Melee76739', '2018-08-08', '2018-09-08'),
('b49', 3, 'Forem12123', '2018-08-08', '2018-09-08'),
('b47', 2, 'Melee76739', '2018-08-08', '2018-09-08'),
('b48', 2, 'Melee76739', '2018-08-08', '2018-09-08'),
('b38', 3, 'Forem12123', '2018-08-25', '2018-09-25'),
('b43', 3, 'Melee76739', '2018-08-25', '2018-09-25'),
('b41', 4, 'Melee76739', '2018-08-27', '2018-09-27'),
('b42', 4, 'Curre71177', '2018-08-27', '2018-09-27'),
('b38', 3, 'Curre71177', '2018-08-03', '2018-09-03')
;

-- Verify that insert statement worked correctly
select * from book_loans;

-- 1.) How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"? Answer = 4
SELECT BOOK_COPIES.BookID, BOOK_COPIES.BranchID, BOOK_COPIES.Number_Of_Copies, LIBRARY_BRANCH.BranchName, BOOKS.Title
FROM BOOK_COPIES
INNER JOIN LIBRARY_BRANCH ON BOOK_COPIES.BranchID = LIBRARY_BRANCH.BranchID
INNER JOIN BOOKS ON BOOK_COPIES.BookID = BOOKS.BookID
WHERE LIBRARY_BRANCH.BranchName = 'Sharpstown'
AND BOOKS.Title = 'The Lost Tribe'

-- 2.) How many copies of the book titled "The Lost Tribe" are owned by each library branch? Answer = Central has 12, Sharpstown has 4, Ashbury has 6, Sotheby has 5
SELECT BOOK_COPIES.BookID, BOOK_COPIES.BranchID, BOOK_COPIES.Number_Of_Copies, LIBRARY_BRANCH.BranchName, BOOKS.Title
FROM BOOK_COPIES
INNER JOIN LIBRARY_BRANCH ON BOOK_COPIES.BranchID = LIBRARY_BRANCH.BranchID
INNER JOIN BOOKS ON BOOK_COPIES.BookID = BOOKS.BookID
WHERE BOOKS.Title = 'The Lost Tribe'

-- 3.) Retrieve the names of all borrowers who do not have any books checked out. 
SELECT BORROWER.Name, BORROWER.CardNo, BOOK_LOANS.CardNo, BOOK_LOANS.DateDue
FROM BORROWER
FULL OUTER JOIN BOOK_LOANS ON BORROWER.CardNo = BOOK_LOANS.CardNo
WHERE BOOK_LOANS.DateDue IS NULL

-- 4.) For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.
SELECT BOOKS.Title, BORROWER.Name, BORROWER.Address, BOOK_LOANS.DateDue
FROM BOOK_LOANS
INNER JOIN LIBRARY_BRANCH ON BOOK_LOANS.BranchID=LIBRARY_BRANCH.BranchID
INNER JOIN BORROWER ON BOOK_LOANS.CardNo=BORROWER.CardNo
INNER JOIN BOOKS ON BOOK_LOANS.BookID=BOOKS.BookID
WHERE LIBRARY_BRANCH.BranchName = 'Sharpstown'
AND BOOK_LOANS.DateDue = '2018-09-08'

-- 5.) For each library branch, retrieve the branch name and the total number of books loaned out from that branch.
SELECT COUNT (*) AS "Total_Loans", LIBRARY_BRANCH.BranchName
FROM LIBRARY_BRANCH
INNER JOIN BOOK_LOANS ON LIBRARY_BRANCH.BranchID = BOOK_LOANS.BranchID
GROUP BY LIBRARY_BRANCH.BranchName

-- 6.) Retrieve the names, addresses, and the number of books checked out for all borrowers who have more than five books checked out. NOT WORKING
SELECT BORROWER.Name, BOOK_LOANS.DateOut, COUNT (*) AS "Total on Loan" 
FROM BORROWER
INNER JOIN BOOK_LOANS ON BORROWER.CardNo = BOOK_LOANS.CardNo
INNER JOIN BOOKS ON BOOK_LOANS.BookID = BOOKS.BookID
GROUP BY BORROWER.Name, BORROWER.Address, BOOK_LOANS.DateOut
HAVING COUNT (*) > 5

-- 7.) For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".
SELECT BOOK_AUTHORS.AuthorName, BOOKS.Title, BOOK_COPIES.Number_Of_Copies, LIBRARY_BRANCH.BranchName
FROM BOOKS
INNER JOIN BOOK_AUTHORS ON BOOKS.BookID = BOOK_AUTHORS.BookID
INNER JOIN BOOK_COPIES ON BOOKS.BookID = BOOK_COPIES.BookID
INNER JOIN LIBRARY_BRANCH ON LIBRARY_BRANCH.BranchID = BOOK_COPIES.BranchID
WHERE BOOK_AUTHORS.AuthorName = 'Stephen King'