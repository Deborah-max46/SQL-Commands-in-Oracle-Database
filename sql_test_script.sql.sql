Creates a table to store student information
CREATE TABLE STUDENT (
    student_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    date_of_birth DATE,
    email VARCHAR2(100)
);
Creates a table to store teacher information
CREATE TABLE TEACHER (
    teacher_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    email VARCHAR2(100),
    department VARCHAR2(50)
);
Creates a table to store course information
CREATE TABLE COURSE (
    course_id NUMBER PRIMARY KEY,
    course_name VARCHAR2(100) NOT NULL,
    credits NUMBER,
    teacher_id NUMBER,
    FOREIGN KEY (teacher_id) REFERENCES TEACHER(teacher_id)
);
Creates a table to store enrollment information
CREATE TABLE ENROLLMENT (
    enrollment_id NUMBER PRIMARY KEY,
    student_id NUMBER,
    course_id NUMBER,
    enrollment_date DATE,
    grade VARCHAR2(2),
    FOREIGN KEY (student_id) REFERENCES STUDENT(student_id),
    FOREIGN KEY (course_id) REFERENCES COURSE(course_id)
);
Inserts a new student record into the STUDENT table
INSERT INTO STUDENT (student_id, name, date_of_birth, email)
VALUES (1, 'John Doe', TO_DATE('2000-01-15', 'YYYY-MM-DD'), 'john.doe@email.com');

Inserts a new teacher record into the TEACHER table.
INSERT INTO TEACHER (teacher_id, name, email, department)
VALUES (1, 'Jane Smith', 'jane.smith@email.com', 'Computer Science');

Inserts a new course record into the COURSE table.
INSERT INTO COURSE (course_id, course_name, credits, teacher_id)
VALUES (1, 'Introduction to Databases', 3, 1);

Inserts a new enrollment record into the ENROLLMENT table.
INSERT INTO ENROLLMENT (enrollment_id, student_id, course_id, enrollment_date)
VALUES (1, 1, 1, SYSDATE);

Updates the email address of a specific student in the STUDENT table.
UPDATE STUDENT
SET email = 'john.doe.updated@email.com'
WHERE student_id = 1;

Deletes a specific enrollment record from the ENROLLMENT table.
DELETE FROM ENROLLMENT
WHERE student_id = 1 AND course_id = 1;

Retrieves student name, course name, teacher name, enrollment date, and grade by joining all four tables.
SELECT s.name AS student_name, c.course_name, t.name AS teacher_name, e.enrollment_date, e.grade
FROM STUDENT s
JOIN ENROLLMENT e ON s.student_id = e.student_id
JOIN COURSE c ON e.course_id = c.course_id
JOIN TEACHER t ON c.teacher_id = t.teacher_id;

Adds a new column 'phone_number' to the STUDENT table.
ALTER TABLE STUDENT ADD phone_number VARCHAR2(15);

Updates the number of credits for a specific course in the COURSE table.
UPDATE COURSE SET credits = 4 WHERE course_id = 1;

Inserts another student record into the STUDENT table.
    INSERT INTO STUDENT (student_id, name) VALUES (2, 'Jane Doe');

    Creates a savepoint named 'save1' in the current transaction.
    SAVEPOINT save1;

    Updates the email of the newly inserted student.
    UPDATE STUDENT SET email = 'jane.doe@email.com' WHERE student_id = 2;

    Rolls back the transaction to the savepoint 'save1', undoing the last UPDATE.
    ROLLBACK TO save1;

    Retrieves all students born after January 1, 1995.
SELECT * FROM STUDENT WHERE date_of_birth > TO_DATE('1995-01-01', 'YYYY-MM-DD');

Inserts another course record into the COURSE table.
INSERT INTO COURSE (course_id, course_name, credits, teacher_id)
VALUES (2, 'Advanced Database Systems', 4, 1);

Updates the department of a specific teacher in the TEACHER table.
UPDATE TEACHER SET department = 'Information Technology' WHERE teacher_id = 1;

