


--PART1



CREATE TABLE Users (
id integer(11) AUTO_INCREMENT PRIMARY KEY,
firstname VARCHAR(30) NOT NULL,
lastname VARCHAR(30) NOT NULL,
email VARCHAR(50) NOT NULL,
age integer(11) NOT NULL,
pid varchar(30) NOT NULL,
is_prof integer(11) NOT NULL,
created_at timestamp DEFAULT CURRENT_TIMESTAMP
);
DESCRIBE Users
DROP TABLE Users

CREATE TABLE Rooms (
id integer(11) AUTO_INCREMENT PRIMARY KEY,
room_name VARCHAR(30) NOT NULL,
room_number VARCHAR(30) NOT NULL,
capacity integer(11) NOT NULL,
created_at timestamp DEFAULT CURRENT_TIMESTAMP
);
DESCRIBE Rooms
DROP TABLE Rooms

CREATE TABLE Courses (
id integer(11) AUTO_INCREMENT PRIMARY KEY,
coursename VARCHAR(30) NOT NULL,
prof_id integer(11) NOT NULL,
room_id integer(11) NOT NULL,
created_at timestamp DEFAULT CURRENT_TIMESTAMP
)
DESCRIBE courses
DROP TABLE courses

CREATE TABLE Enrollments (
id integer(11) AUTO_INCREMENT PRIMARY KEY,
course_id integer(11) NOT NULL,
student_id integer(11) NOT NULL
)
DESCRIBE Enrollments
DROP TABLE Enrollments



--part2



INSERT INTO Users (firstname, lastname, email, age, pid, is_prof)
VALUE
('tom','jones','tom@jones.com', 23, 'A100', 0),
('bill','smith','bill@smith.com', 24, 'A200', 0),
('kim','possible','kim@possible.com', 22, 'A300', 0),
('jessica','rabbit','jessica@rabbit.com', 23, 'A400', 0),
('veronica','mars','veronica@mars.com', 30, 'A500', 0),
('marge','simpson','marge@simpson.com', 24, 'A600', 0),
('ramsin','khoshabeh','ramsin@kkoshabeh.com', 30, 'A700', 0),
('rick','gessner','rick@gessner.com', 59, 'A800', 0);
SELECT * FROM Users

INSERT INTO Rooms (room_name, room_number, capacity)
VALUE
('alcatraz', 25, 50),
('rikers', 35, 25),
('sing-sing', 80, 75);
SELECT * FROM Rooms

INSERT INTO Courses (coursename, prof_id, room_id)
VALUE
('ECE140', 7, 2),
('ECE141', 8, 3);
SELECT * FROM Courses

INSERT INTO Enrollments (course_id, student_id)
VALUE
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 2),
(2, 3),
(2, 5),
(2, 6);
SELECT * FROM Enrollments



--part3



#
SELECT count(id) from Users;
#
SELECT avg(age) from Users;
#
SELECT count(course_id) FROM Enrollments where course_id=1;
SELECT count(course_id) FROM Enrollments where course_id=2;
#
SELECT Users.firstname, Users.lastname, Enrollments.course_id
FROM Users
INNER JOIN Enrollments ON Users.id=Enrollments.student_id AND course_id=2;
#
SELECT first_name, last_name, coursename, count(course_id=2)
FROM Users Join Courses join Enrollments on(Users.id=7 or Users.id=8)
Group By course_id;
