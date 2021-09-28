CREATE TABLE instructors(
	instructor_id INT PRIMARY KEY NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL
);

CREATE TABLE students(
	student_id INT NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    instructor_id INT NOT NULL,
    FOREIGN KEY (instructor_id) 
		REFERENCES instructors(instructor_id) 
        ON DELETE CASCADE,
    PRIMARY KEY (student_id)
);

DROP TABLE students;

SELECT *
FROM instructors;

INSERT INTO students( student_id, first_name, last_name, instructor_id )
VALUES  ( 12345, 'Alex', 'Miller', 456 ),
		( 67890, 'Michael', 'Salazar', 456 ),
        ( 23451, 'Ana', 'Gonzalez', 222 ),
        ( 23412, 'Julieta', 'Garcia', 555 );

SELECT *
FROM students;

SELECT s.student_id, s.first_name, s.last_name, i.first_name AS Instructor_First_name, i.last_name AS Instructor_Last_name
FROM students s JOIN instructors i ON i.instructor_id = s.instructor_id;

SELECT s.student_id, s.first_name, s.last_name, i.first_name AS Instructor_First_name, i.last_name AS Instructor_Last_name
FROM students s, instructors i
WHERE i.instructor_id = s.instructor_id;

SELECT *
FROM instructors i LEFT JOIN students s ON i.instructor_id = s.instructor_id;

DELETE FROM instructors
WHERE instructor_id = 456;

UPDATE students
SET instructor_id = 456
WHERE instructor_id = 123;

DELETE FROM students
WHERE student_id = 23412;
