# SQL-Commands-in-Oracle-Database
With a successful installation of Oracle, managed to execute different sql commands.
Navigate through the attached "sql_test_script.sql" to see them all.

Design and implement a relational database system to manage academic information for a school. The system should capture details about students, teachers, courses, and enrollment data. The solution should enable the following operations:

Student Management:

Store and manage student details, including unique student IDs, names, dates of birth, and contact information (e.g., email, phone).
Support updates to student information (e.g., email address updates).
Allow insertion of new students while ensuring mandatory fields (like name) are not left blank.
Teacher Management:

Capture and store teacher information, including unique teacher IDs, names, emails, and their department affiliations.
Enable updates to the department for a teacher.
Course Management:

Store course information, including unique course IDs, course names, the number of credits, and the associated teacher.
Support modifications to course details (e.g., adjusting course credits).
Allow addition of new courses and associate them with a teacher.
Enrollment Tracking:

Track student enrollments in courses, including the enrollment date and student grades.
Support the removal of a student from a course.
Enable queries that retrieve relevant data such as the student’s name, course name, teacher name, enrollment date, and grade.
Transaction Management:

Implement transaction control using savepoints and rollbacks to ensure data integrity when performing updates.
Data Retrieval and Queries:

Provide functionality to query data for various reports, such as listing all students born after a certain date or generating detailed enrollment reports that include student names, course details, and teacher information.
Schema Modifications:

Allow updates to the database schema, such as adding new columns (e.g., phone number for students).
The system should ensure referential integrity between tables, with foreign key constraints linking enrollments to students and courses, and courses to teachers. All operations should be optimized for efficiency and ease of data management.

A clear explanation of the result and transaction:
1. Table Creation:
STUDENT: Stores student information (ID, name, date of birth, email). student_id is the primary key.
TEACHER: Stores teacher details (ID, name, email, department). teacher_id is the primary key.
COURSE: Stores course data (ID, course name, credits, teacher_id). teacher_id is a foreign key referencing the TEACHER table.
ENROLLMENT: Tracks student enrollments in courses. It contains enrollment_id as the primary key, student_id (foreign key referencing STUDENT), and course_id (foreign key referencing COURSE), along with other details like the enrollment date and grade.
2. Data Insertion:
Insert into STUDENT:
Adds a student with ID 1, name "John Doe", date of birth 2000-01-15, and email john.doe@email.com into the STUDENT table.
Insert into TEACHER:
Adds a teacher with ID 1, name "Jane Smith", email jane.smith@email.com, and department "Computer Science" into the TEACHER table.
Insert into COURSE:
Adds a course with ID 1, name "Introduction to Databases", 3 credits, and is taught by teacher 1 (Jane Smith).
Insert into ENROLLMENT:
Enrolls student 1 (John Doe) in course 1 (Introduction to Databases), with the current date as the enrollment date.
3. Update Operations:
Update email in STUDENT:
Updates the email of student 1 (John Doe) from john.doe@email.com to john.doe.updated@email.com. This operation ensures that student contact details stay current.
Update COURSE credits:
Updates the number of credits for the course 1 (Introduction to Databases) from 3 to 4. This might reflect a change in the course's academic weight.
Update TEACHER department:
Changes the department for teacher 1 (Jane Smith) from "Computer Science" to "Information Technology". This could reflect an internal department shift for the teacher.
4. Delete Operations:
Delete from ENROLLMENT:
Removes the record where student 1 (John Doe) is enrolled in course 1 (Introduction to Databases). This action reflects dropping a course or canceling an enrollment.
5. Data Retrieval (SELECT Queries):
Join Query for Enrollment Details:

This query retrieves detailed information from multiple tables by joining them:
The student’s name (STUDENT table).
The course name (COURSE table).
The teacher’s name (TEACHER table).
The enrollment date and grade (ENROLLMENT table).
It provides a consolidated view of who is enrolled in which course, which teacher is responsible, and the enrollment details.
Filter by Date of Birth:

The query selects all students born after 1995-01-01. This can be used to filter students within a certain age range.
6. Schema Modification (ALTER TABLE):
Add phone_number column to STUDENT:
This alters the STUDENT table to include a new column for the student’s phone number. This allows the system to capture additional contact information for students without affecting existing data.
7. Transaction Management:
Insert into STUDENT (Jane Doe):
Adds a new student with ID 2 and name "Jane Doe". No email is provided at this point.
SAVEPOINT:
A savepoint named save1 is created. This marks a point to which the transaction can be rolled back later if needed.
Update STUDENT email for Jane Doe:
Updates student 2 (Jane Doe) by setting her email to jane.doe@email.com.
ROLLBACK:
The ROLLBACK TO save1 command undoes the last update for Jane Doe’s email. As a result, student 2 remains in the database with no email set, as it was before the savepoint.
Explanation of Transactions:
SAVEPOINT:
A savepoint creates a temporary point in a transaction to which the system can return if needed. In this case, the system allows updating Jane Doe’s email but rolls back the change, returning to the state where no email was set.
ROLLBACK:
Rollback undoes any changes made after the savepoint was created. This ensures that updates can be safely reversed if needed, preserving data integrity.
By using these features, the database ensures that only valid, accurate, and current information is stored while allowing flexibility in data management through updates, deletions, and transactional control.
