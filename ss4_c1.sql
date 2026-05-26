CREATE SCHEMA university2;
CREATE TABLE  university2.Students (
    id SERIAL PRIMARY KEY ,
    name VARCHAR(50),
    age INT,
    major VARCHAR(50),
    gpa DECIMAL(3,2)
);


INSERT INTO  university2.Students (name, age, major, gpa)
VALUES ('An',20,'CNTT',3.5),
       ('Bình',21,'Toán',3.2),
       ('Cường',22,'CNTT',3.8),
       ('Dương',20,'Vật lý',3.0),
       ('Em',21,'CNTT',2.9);


---1
INSERT INTO  university2.Students (name, age, major, gpa)
VALUES ('Hùng',23,'Hóa học',3.4);

--2--
UPDATE university2.Students
SET gpa=3.6 WHERE name = 'Bình';

--3--
DELETE FROM university2.Students WHERE gpa < 3.0;

--4--
SELECT s.name AS "Ten sinh vien", s.major AS "Chuyen nganh"
FROM university2.Students s ORDER BY s.gpa DESC;

--5--
SELECT s.name AS "Ten sinh vien" FROM university2.Students s WHERE s.major='CNTT' ORDER BY s.name LIMIT 1;

--6--
SELECT s.name, s.age, s.gpa, s.major FROM university2.Students s WHERE s.gpa BETWEEN 3.0 AND 3.6;

--7--
SELECT s.name FROM university2.Students s WHERE s.name LIKE 'C%';

--8--
--Hiển thị 3 sinh viên đầu tiên theo thứ tự tên tăng dần
SELECT s.name FROM university2.Students s ORDER BY s.name ASC LIMIT 3;
--lấy từ sinh viên thứ 2 đến thứ 4 bằng LIMIT và OFFSET
SELECT s.name FROM university2.Students s ORDER BY s.name LIMIT 3 OFFSET 1;