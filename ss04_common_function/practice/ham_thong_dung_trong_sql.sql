use quan_ly_sinh_vien;

SELECT address, COUNT(student_id) AS 'Số lượng học viên'
FROM student
GROUP BY address;

SELECT S.student_id,S.student_name, AVG(M.mark)
FROM student S join mark M on S.student_id = M.student_id
GROUP BY S.student_id;

SELECT S.student_id,S.student_name, AVG(M.mark)
FROM student S join mark M on S.student_id = M.student_id
GROUP BY S.student_id
HAVING AVG(mark) > 15;

SELECT S.student_id,S.student_name, AVG(M.mark)
FROM student S join mark M on S.student_id = M.student_id
GROUP BY S.student_id
HAVING AVG(M.mark) >= ALL (SELECT AVG(M.mark) FROM mark GROUP BY student_id);
