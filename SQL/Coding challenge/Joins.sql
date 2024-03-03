USE sqlassessment;

---INNER JOIN USING THE DATABASE Sqlassessment

SELECT Students.student_id, student_name, grade_id, subject, score
FROM Students
INNER JOIN Grades ON Students.student_id = Grades.student_id;

--- LEFT JOIN USING THE DATABASE Sqlassessment

SELECT Students.student_id,student_name,subject,score FROM Students
LEFT JOIN Grades ON Students.student_id=Grades.student_id;

---RIGHT JOIN USING THE DATABASE Sqlassessment
SELECT Students.student_id, student_name, grade_id, subject, score
FROM Students
RIGHT JOIN Grades ON Students.student_id = Grades.student_id;

---CROSS JOIN USING THE DATABASE Sqlassessment
SELECT Students.student_id, student_name, grade_id, subject, score
FROM Students
CROSS JOIN Grades;

---FULL JOIN USING THE DATABASE Sqlassessment
SELECT Students.student_id, student_name, grade_id, subject, score
FROM Students
FULL JOIN Grades ON Students.student_id = Grades.student_id;

---SELF JOIN USING THE DATABASE Sqlassessment
SELECT s1.student_name AS student_name, s2.student_name AS selfjoin_names
FROM Students s1
JOIN Students s2 ON s1.student_id <> s2.student_id;