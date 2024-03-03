CREATE DATABASE sqlassessment;
USE sqlassessment;

CREATE TABLE Students (
student_id INT PRIMARY KEY,
student_name Varchar(50)
);

CREATE TABLE Grades (
grade_id INT PRIMARY KEY,
student_id INT,
subject VARCHAR(50),
score INT,
FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

INSERT INTO Students(student_id,student_name) VALUES
(1, 'Siddhu'),
(2, 'Srikanth'),
(3, 'Ramesh');

INSERT INTO Grades(grade_id,student_id,subject,score) VALUES
(201,1,'science',85),
(202,1,'english',88),
(203,2,'maths',95),
(204,2,'social',80),
(205,3,'hindi',81);
SELECT * FROM Students; SELECT * FROM Grades;

---EXECUTING WITH OVER AND PARTITION BY 

SELECT s.student_id, s.student_name,g.subject,g.score, AVG(g.score) OVER (PARTITION BY s.student_id ORDER BY g.subject) AS avg_score
FROM Students s JOIN Grades g ON s.student_id=g.student_id;

---CREATING SUBTOTAL AND CREATING AGGREGATION FOR EACH STUDENT

SELECT s.student_id,s.student_name, COUNT(*) AS total_subjects,AVG(g.score) AS avg_subject_score
FROM Students s JOIN Grades g ON s.student_id=g.student_id 
GROUP BY s.student_id,s.student_name;

---NOW TOTAL AGGREGATIONS (calculating overall Averages)

SELECT AVG(total_subjects) AS avg_total_subjects, AVG(avg_subject_score) AS avg_overall_score
FROM (
SELECT s.student_id, COUNT(*) AS total_subjects, AVG(g.score) AS avg_subject_score
FROM Students s JOIN Grades g ON s.student_id=g.student_id
GROUP BY s.student_id
) Subtotals;


