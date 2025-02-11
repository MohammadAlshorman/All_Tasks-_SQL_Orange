

--Task 12.2.2025CE


CREATE DATABASE SchoolManagement;


CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Address NVARCHAR(255),
    Email NVARCHAR(100) UNIQUE
);

CREATE TABLE Family_Info (
    FamilyID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT UNIQUE,
    FatherName NVARCHAR(100),
    ContactNumber NVARCHAR(20),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY IDENTITY(1,1),
    CourseName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255),
    Resource NVARCHAR(255)
);

CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Classes (
    ClassID INT PRIMARY KEY IDENTITY(1,1),
    CourseID INT,
    ClassCode NVARCHAR(50) NOT NULL,
    RoomNumber NVARCHAR(50),
    Schedule TEXT,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Assignments (
    AssignmentID INT PRIMARY KEY IDENTITY(1,1),
    CourseID INT,
    AssignmentName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255),
    DueDate DATE,
    State NVARCHAR(10) CHECK (State IN ('Pass', 'Failed')),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT,
    AttendanceDate DATE NOT NULL,
    AbsenceType NVARCHAR(10) CHECK (AbsenceType IN ('Leaving', 'Absence', 'Late')),
    Reason NVARCHAR(255),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

INSERT INTO Students (FullName, DateOfBirth, Address, Email) VALUES 
('shorman', '2002-09-07', ' dapouq', 'shorman1@orange.jo'),
('mohammad', '2005-06-15', 'dapouq', 'shorman2@orange.jo'),
('ali', '2018-02-10', 'irbid', 'shormann3@orange.jo'),
('soso', '2004-12-05', 'irbid', 'shorman4@orange.jo'),
('tala', '2002-03-20', ' dapouq', 'shorman5@orange.jo');

INSERT INTO Family_Info (StudentID, FatherName, ContactNumber) VALUES 
(1, 'shorman1', '0777077700'),
(2, 'shorman2', '07770777000'),
(3, 'shorman3', '07770777009'),
(4, 'shorman4', '0777077700'),
(5, 'shorman5', '0777077700');

INSERT INTO Courses (CourseName, Description, Resource) VALUES 
('Mathematics', 'Basic math concepts', 'math_textbook.pdf'),
('Physics', 'Fundamentals of physics', 'physics_manual.pdf'),
('puter Science', 'Programming basics', 'cs_guide.pdf'),
('SQL', 'Database management', 'sql_reference.pdf'),
('History', 'World history overview', 'history_book.pdf');

INSERT INTO Enrollments (StudentID, CourseID) VALUES 
(1, 1), (1, 3), (2, 1), (2, 4), (3, 2), 
(3, 5), (4, 1), (4, 3), (5, 2), (5, 4);

INSERT INTO Classes (CourseID, ClassCode, RoomNumber, Schedule) VALUES 
(1, 'MATH101', 'Room 101', 'Mon/Wed 10:00-11:30'),
(2, 'PHYS201', 'Room 202', 'Tue/Thu 12:00-13:30'),
(3, 'CS301', 'Room 303', 'Mon/Wed/Fri 14:00-15:30'),
(4, 'SQL401', 'Room 404', 'Tue/Thu 16:00-17:30'),
(5, 'HIST501', 'Room 505', 'Wed/Fri 09:00-10:30');

INSERT INTO Assignments (CourseID, AssignmentName, Description, DueDate, State) VALUES 
(1, 'Algebra Homework', 'Solve 10 problems', '2025-02-20', 'Pass'),
(2, 'Physics Lab Report', 'Write experiment results', '2025-03-05', 'Failed'),
(3, 'Programming Project', 'Develop a simple app', '2025-03-15', 'Pass'),
(4, 'SQL Queries', 'Write plex queries', '2025-03-25', 'Pass'),
(5, 'History Essay', 'Analyze historical events', '2025-04-01', 'Failed');

INSERT INTO Attendance (StudentID, AttendanceDate, AbsenceType, Reason) VALUES 
(1, '2024-01-02', 'Leaving', 'Family emergency'),
(2, '2024-01-03', 'Absence', 'Sick'),
(3, '2024-01-04', 'Late', 'Traffic jam'),
(4, '2024-01-05', 'Leaving', 'Doctor appointment'),
(5, '2024-01-06', 'Absence', 'Personal reasons');




-- 1
SELECT * FROM Students WHERE DateOfBirth = '2005-03-15';

-- 2- 
SELECT * FROM Courses WHERE CourseName = 'Mathematics';

--3
ALTER TABLE Students ADD Email NVARCHAR(100) UNIQUE;

-- 4- 
INSERT INTO Students (FullName, DateOfBirth, Address, Email) 
VALUES ('Alice Johnson', '2006-08-25', 'San Francisco, USA', 'alice.johnson@orange.jo.');

-- 5- 
SELECT * FROM Students
JOIN Family_Info ON Students.StudentID = Family_Info.StudentID;

-- 6- 
SELECT Students.StudentID, Students.FullName, Courses.CourseName 
FROM Students
JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
JOIN Courses ON Enrollments.CourseID = Courses.CourseID
WHERE Courses.CourseName = 'Mathematics';

-- 7-
SELECT Students.StudentID, Students.FullName, Assignments.AssignmentName, Assignments.State 
FROM Students
JOIN Assignments ON Assignments.CourseID IN (
    SELECT CourseID FROM Courses WHERE CourseName = 'SQL'
)
WHERE Assignments.State = 'Pass';

--8 
SELECT Students.StudentID, Students.FullName, Attendance.AttendanceDate, Attendance.AbsenceType 
FROM Students
JOIN Attendance ON Students.StudentID = Attendance.StudentID
WHERE Attendance.AbsenceType = 'Leaving'
AND Attendance.AttendanceDate BETWEEN '2024-01-01' AND '2024-01-05';