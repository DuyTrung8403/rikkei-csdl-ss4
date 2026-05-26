CREATE SCHEMA cau3;

CREATE TABLE  cau3.Students (
    id SERIAL PRIMARY KEY ,
    full_name VARCHAR(50) NOT NULL ,
    gender VARCHAR (10) NOT NULL,
    birth_year INT CHECK ( birth_year < EXTRACT(YEAR FROM CURRENT_DATE) ) NOT NULL,
    major VARCHAR(50) NOT NULL,
    gpa DECIMAL(3,2) CHECK ( gpa BETWEEN 0 AND 4)
);

INSERT INTO cau3.Students (full_name, gender, birth_year, major, gpa)
VALUES ('Nguyễn Văn A','Nam',2002,'CNTT', 3.6),
       ('Trần Thị Bích Ngọc','Nữ',2001,'Kinh tế', 3.2),
       ('Lê Quốc Cường','Nam',2003,'CNTT', 2.7),
       ('Phạm Minh Anh','Nữ',2000,'Luật', 3.9),
       ('Nguyễn Văn A','Nam',2002,'CNTT', 3.6),
       ('Lưu Đức Tài','Nam',2004,'Cơ khí', NULL),
       ('Võ Thị Thu Hằng','Nữ',2001,'CNTT', 3.0);


-- Chèn dữ liệu mới: Thêm sinh viên “Phan Hoàng Nam”, giới tính Nam, sinh năm 2003, ngành CNTT, GPA 3.8
INSERT INTO cau3.Students (full_name, gender, birth_year, major, gpa)
VALUES ('Phan Hoàng Nam','Nam',2003,'CNTT', 3.8);

-- Cập nhật dữ liệu:Sinh viên “Lê Quốc Cường” vừa cải thiện học lực, cập nhật gpa = 3.4
UPDATE cau3.Students SET gpa=3.4 WHERE full_name='Lê Quốc Cường';

-- Xóa dữ liệu:Xóa tất cả sinh viên có gpa IS NULL
DELETE FROM cau3.Students WHERE gpa IS NULL;

-- Truy vấn cơ bản:Hiển thị sinh viên ngành CNTT có gpa >= 3.0, chỉ lấy 3 kết quả đầu tiên
SELECT s.full_name, s.birth_year, s.major, s.gender, s.gpa FROM cau3.Students s
WHERE s.gpa >= 3.0 AND s.major='CNTT' ORDER BY  gpa DESC LIMIT 3;

-- Loại bỏ trùng lặp:Liệt kê danh sách ngành học duy nhất
SELECT DISTINCT major FROM cau3.Students;

-- Sắp xếp:Hiển thị sinh viên ngành CNTT, sắp xếp giảm dần theo GPA, sau đó tăng dần theo tên
SELECT s.full_name, s.birth_year, s.major, s.gender, s.gpa FROM cau3.Students s
ORDER BY s.gpa DESC, s.full_name ASC;

-- Tìm kiếm:Tìm sinh viên có tên bắt đầu bằng “Nguyễn”
SELECT s.full_name, s.birth_year, s.major, s.gender, s.gpa FROM cau3.Students s
WHERE s.full_name ILIKE ('Nguyễn%');

-- Khoảng giá trị:Hiển thị sinh viên có năm sinh từ 2001 đến 2003
SELECT s.full_name, s.birth_year, s.major, s.gender, s.gpa FROM cau3.Students s
WHERE s.birth_year BETWEEN 2001 AND 2003;