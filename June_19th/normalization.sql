--ANOMILIES

--Undesirable condition that can lead to data inconsistency
USE ENROLL;

SELECT* FROM Student_course;


--Insertion ANOMILIES
--Suppose that you want to insert a new course into the course_name which no student has been assigned to yet.

INSERT INTO Student_course(student_id,student_name,course_id,course_name)VALUES(NULL,NULL,104,"ENV");

--This will lead to data inconsistency as student_id and student_name cannot be null


--Deletion Anomilies
    -- Suppose you want to delete a students enrollment. Lets suppose u want to delete student_id = 4 data. Along with this
    -- your entire course MTH data will get deleted.

DELETE FROM Student_course
WHERE student_id = 4;


--Updation Anomalies 
    -- Suppose you want to update an instructor for the course. 
    --Since the course id is duplicated in multiple rows, you must update Instrucors name for every occurrence of the course id 
    --to avoid inconsistency.
  
    ALTER TABLE Student_course
    ADD Instructor VARCHAR(25);

    UPDATE Student_course
    SET Instructor = "Mr Brown Smith"
    WHERE course_id = 101;

--PRIMARY KEY
    --UNIQUE VALUES
    --NO null values allowed
    --Usually is used to create a unique identity of table.
    --There should be only 1 primary key.
    --To add primary key just insert PRIMARY KEY next to the varbale while creating it.
    --Example
    CREATE TABLE Courses(course_id INT PRIMARY KEY, course_name VARCHAR(25),Student_id INT);
--FORIEGN KEY
    -- Allows you to connect to mutliple tables easily.
    --Example
    CREATE TABLE Enrollment( enr_id INT, enr_name VARCHAR(50),Student_id INT, FOREIGN KEY(Student_id) REFERENCES Student_course(student_id));

--Adding primary key to the existing table
ALTER TABLE Enrollment
ADD PRIMARY KEY(enr_id);

--Adding Foreign key to the existing table
ALTER TABLE Courses
ADD FOREIGN KEY(student_id)
REFERENCES Student_course(student_id);

--NORMALIZATION
    --It's way of organizing the table to avoid data redudancy and follow data integrety
    --Types of NORMALIZATION
        --1NF
        --2NF
        --3NF
        --Boyce-Codd Normal Form
     
     --1NF - Contains atomic values(only one value)
     
     --Example
     SELECT * FROM Student_course;

     --Student Course has coloumn Instructor which doesn't contain atomic value

     UPDATE Student_course
     SET Instructor = "Dr.BROWN"
     WHERE course_id = 101;

     UPDATE Student_course
     SET Instructor = "DR.SMITH"
     WHERE course_id = 103;

     --2NF - To achieve 2NF we need to ensure that the table is in 1NF form. Remove partial edpendencies by creating new table

    -- Now let separate this table into Students and Courses
    CREATE TABLE Students (student_id INT PRIMARY KEY, student_name varchar(25));
    INSERT INTO Students(student_id , student_name) VALUES (1,"Puneet"),(2,"Ria"),(3,"Jiya");

    CREATE TABLE Course(course_id INT PRIMARY KEY, course_name VARCHAR(50),Instructor VARCHAR(50));
    INSERT INTO Course(course_id, course_name,Instructor)VALUES(101,"PHY","DR.BROWN"),(103,"CHE","DR.SMITH");

    CREATE TABLE Enrollments(Student_id INT, Course_id INT, PRIMARY KEY (Student_id, Course_id),FOREIGN KEY(Student_id) REFERENCES Students(student_id) ,FOREIGN KEY (Course_id) REFERENCES Course(course_id));
    
    INSERT INTO Enrollments(Student_id, Course_id) VALUES(1,101),(2,103),(3,101);
  
    --3NF - The table must be in 2NF. There shouldn't exist any transitive dependency;
    SELECT* FROM Students;
    SELECT* FROM Course;
    SELECT * FROM Enrollments;
    --The following tables are already in 3NF form.

--BNCF - Boyce-Codd Normal Form
    --to achieve BNCF we need to make sure that the table is in 3NF form and it has coloumns in tables which can become a candidate key
    SELECT* FROM Students;
    SELECT* FROM Course;
    SELECT * FROM Enrollments;
    --The above tables are already in BCNF form
    