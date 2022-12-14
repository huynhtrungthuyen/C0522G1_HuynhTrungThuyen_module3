DROP DATABASE IF EXISTS quan_ly_sinh_vien;
CREATE DATABASE quan_ly_sinh_vien;
USE quan_ly_sinh_vien;

CREATE TABLE class
(
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(60) NOT NULL,
    start_date DATETIME NOT NULL,
    `Status` BIT
);

CREATE TABLE student
(
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(30) NOT NULL,
    address VARCHAR(50),
    phone VARCHAR(20),
    `Status` BIT,
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES class (class_id)
);
CREATE TABLE `subject`
(
    subject_id INT AUTO_INCREMENT PRIMARY KEY,
    subject_name VARCHAR(30) NOT NULL,
    credit TINYINT NOT NULL DEFAULT 1 CHECK (Credit >= 1),
    `Status` BIT DEFAULT 1
);

CREATE TABLE Mark
(
    mark_id INT AUTO_INCREMENT PRIMARY KEY,
    subject_id INT NOT NULL,
    student_id INT NOT NULL,
    mark FLOAT DEFAULT 0 CHECK (mark BETWEEN 0 AND 100),
    exam_times TINYINT DEFAULT 1,
    UNIQUE (subject_id, student_id),
    FOREIGN KEY (subject_id) REFERENCES `Subject` (subject_id),
    FOREIGN KEY (student_id) REFERENCES student (student_id)
);