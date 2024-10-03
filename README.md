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
