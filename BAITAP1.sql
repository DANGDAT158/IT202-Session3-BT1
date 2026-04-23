CREATE DATABASE Supermarket_db;
USE Supermarket_db;

-- 1. Tạo bảng sản phẩm
CREATE TABLE PRODUCTS (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    OriginalPrice DECIMAL(18, 2)
);

-- 2. Chèn dữ liệu mẫu
INSERT INTO PRODUCTS (ProductID, ProductName, Category, OriginalPrice)
VALUES
(1, 'iPhone 15', 'Electronics', 20000000),
(2, 'Samsung Refrigerator', 'Electronics', 15000000),
(3, 'Water Spinach', 'Food', 10000),
(4, 'Filtered Fresh Milk 4L', 'Food', 28000);

-- 3. Kiểm tra trước khi update (best practice)
SELECT * 
FROM PRODUCTS
WHERE Category = 'Electronics';

-- 4. Thực hiện giảm giá đúng yêu cầu (chỉ Electronics)
UPDATE PRODUCTS
SET OriginalPrice = OriginalPrice * 0.9
WHERE Category = 'Electronics';

-- 5. Kiểm tra kết quả sau khi update
SELECT * FROM PRODUCTS;

-- Lỗi nằm ở câu lệnh:
-- UPDATE PRODUCTS
-- SET OriginalPrice = OriginalPrice * 0.9;
-- Nghe thì đúng logic giảm 10%, nhưng thiếu điều kiện WHERE.
-- Trong SQL:
-- UPDATE không có WHERE = cập nhật toàn bộ bảng
-- Nghĩa là tất cả sản phẩm (không phân biệt Electronics hay Food) đều bị giảm giá
-- Đây chính là “lỗi kinh điển”:
-- Quên WHERE → update toàn bộ dữ liệu