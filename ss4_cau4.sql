CREATE TABLE cau3.products (
                               id SERIAL PRIMARY KEY,
                               name VARCHAR(50) NOT NULL,
                               category VARCHAR(50) NOT NULL,
                               price DECIMAL(12,2),
                               stock INT,
                               manufacturer VARCHAR(20)
);

INSERT INTO cau3.products (name, category, price, stock, manufacturer)
VALUES
    ('Laptop Dell XPS 13', 'Laptop', 25000000, 12, 'Dell'),
    ('Chuột Logitech M90', 'Phụ kiện', 150000, 50, 'Logitech'),
    ('Bàn phím cơ Razer', 'Phụ kiện', 2200000, 0, 'Razer'),
    ('Macbook Air M2', 'Laptop', 32000000, 7, 'Apple'),
    ('iPhone 14 Pro Max', 'Điện thoại', 35000000, 15, 'Apple'),
    ('Laptop Dell XPS 13', 'Laptop', 25000000, 12, 'Dell'),
    ('Tai nghe AirPods 3', 'Phụ kiện', 4500000, NULL, 'Apple');



-- Chèn dữ liệu mới:Thêm sản phẩm “Chuột không dây Logitech M170”, loại Phụ kiện, giá 300000, tồn kho 20, hãng Logitech
INSERT INTO cau3.products
(name, category, price, stock, manufacturer)
VALUES('Chuột không dây Logitech M170','Phụ kiện',300000,20, 'Logitech');

-- Cập nhật dữ liệu:Tăng giá tất cả sản phẩm của Apple thêm 10%
UPDATE cau3.products
SET price = price * 1.10
WHERE manufacturer = 'Apple';

-- Xóa dữ liệu:Xóa sản phẩm có stock = 0
DELETE FROM cau3.products
WHERE stock = 0;

-- Lọc theo điều kiện:Hiển thị sản phẩm có price BETWEEN 1000000 AND 30000000
SELECT *
FROM cau3.products
WHERE price BETWEEN 1000000 AND 30000000;

-- Lọc giá trị NULL:Hiển thị sản phẩm có stock IS NULL
SELECT *
FROM cau3.products
WHERE stock IS NULL;

-- Loại bỏ trùng:Liệt kê danh sách hãng sản xuất duy nhất
SELECT DISTINCT manufacturer
FROM cau3.products;

-- Sắp xếp dữ liệu: Hiển thị toàn bộ sản phẩm, sắp xếp giảm dần theo giá, sau đó tăng dần theo tên
SELECT *
FROM cau3.products
ORDER BY price DESC, name ASC;

-- Tìm kiếm (LIKE và ILIKE):Tìm sản phẩm có tên chứa từ “laptop” (không phân biệt hoa thường)
SELECT *
FROM cau3.products
WHERE name ILIKE '%laptop%';

-- Giới hạn kết quả:Lấy về 2 sản phẩm đầu tiên sau khi sắp xếp theo giá giảm dần .
SELECT *
FROM cau3.products
ORDER BY price DESC
LIMIT 2;
