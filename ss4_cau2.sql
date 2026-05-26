CREATE DATABASE ss4;
CREATE SCHEMA cau2;


CREATE TABLE cau2.products(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) CHECK(price > 0),
    stock INT CHECK(stock >= 0)
);

INSERT INTO cau2.products (name, category, price, stock)
VALUES ('Laptop Dell','Electronics',1500.00, 5),
       ('Chuột Logitech','Electronics',25.50, 50),
       ('Bàn phím Razer','Electronics',120.00, 20),
       ('Tủ lạnh LG','Home Appliances',800.00, 3),
       ('Máy giặt Samsung','Home Appliances',600.00, 2);

-- Thêm sản phẩm mới: 'Điều hòa Panasonic', category 'Home Appliances', giá 400.00, stock 10
INSERT INTO cau2.products (name, category, price, stock)
VALUES ('Điều hòa Panasonic','Home Appliances',400.00, 10);

-- Cập nhật stock của 'Laptop Dell' thành 7
UPDATE cau2.products SET stock = 7 WHERE name='Laptop Dell';

-- Xóa các sản phẩm có stock bằng 0 (nếu có)
DELETE FROM cau2.products WHERE stock=0;

-- Liệt kê tất cả sản phẩm theo giá tăng dần
SELECT p.name, p.category, p.stock, p.price FROM cau2.products p ORDER BY p.price ASC;

-- Liệt kê danh mục duy nhất của các sản phẩm (DISTINCT)
SELECT DISTINCT category FROM cau2.products;

-- Liệt kê sản phẩm có giá từ 100 đến 1000
SELECT p.name, p.category, p.stock, p.price FROM cau2.products p
WHERE p.price BETWEEN 100 AND 1000;

-- Liệt kê các sản phẩm có tên chứa từ 'LG' hoặc 'Samsung' (sử dụng LIKE/ILIKE)
SELECT p.name, p.category, p.stock, p.price FROM cau2.products p
WHERE p.name ILIKE '%LG%' OR p.name ILIKE '%Samsung%';

-- Hiển thị 2 sản phẩm đầu tiên theo giá giảm dần, hoặc lấy sản phẩm thứ 2 đến thứ 3 bằng LIMIT và OFFSET
SELECT p.name, p.category, p.stock, p.price FROM cau2.products p
ORDER BY  p.price DESC LIMIT 2;

SELECT p.name, p.category, p.stock, p.price FROM cau2.products p
ORDER BY p.price LIMIT 2 OFFSET 1;


