
CREATE DATABASE SchoolDB;
USE SchoolDB;



CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Subject VARCHAR(100)
);





CREATE TABLE TeacherDetails (
    DetailID INT PRIMARY KEY,
    TeacherID INT UNIQUE, -- Ensures One-to-One
    ExperienceYears INT,
    PhoneNumber VARCHAR(15),
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);




CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    TeacherID INT,
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);


CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthYear INT
);




CREATE TABLE StudentCourses (
    StudentID INT,
    CourseID INT,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


INSERT INTO Teachers VALUES
(1, 'Mohammad', 'shorman1', 'Math'),
(2, 'Mohammad', 'shorman2', 'Physics'),
(3, 'Mohammad', 'shorman3', 'History'),
(4, 'Mohammad', 'shorman4', 'Chemistry'),
(5, 'Mohammad', 'shorman5', 'English');



INSERT INTO TeacherDetails VALUES
(1, 1, 10, '0777777771'),
(2, 2, 8,  '0777777772'),
(3, 3, 12, '0777777774'),
(4, 4, 7, '0777777773'),
(5, 5, 9, '0777777775');


INSERT INTO Courses VALUES
(1, 'Algebra', 1),
(2, 'Mechanics', 2),
(3, 'World History', 3),
(4, 'Organic Chemistry', 4),
(5, 'Grammar', 5);



INSERT INTO Students VALUES
(1, 'Mohammad', 'shorman1', 2002),
(2, 'Mohammad', 'shorman2', 2002),
(3, 'Mohammad', 'shorman3', 2000),
(4, 'Mohammad', 'shorman4', 1999),
(5, 'Mohammad', 'shorman5', 2003);





INSERT INTO StudentCourses VALUES
(1, 1),
(1, 3),
(2, 2),
(2, 5),
(3, 1),
(3, 4),
(4, 3),
(5, 2),
(5, 4),
(5, 5);