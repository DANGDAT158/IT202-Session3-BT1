CREATE DATABASE Supermarket_db;
USE Supermarket_db;

CREATE TABLE PRODUCTS (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    OriginalPrice DECIMAL(18,2)
);

INSERT INTO PRODUCTS (ProductID, ProductName, Category, OriginalPrice)
VALUES
(1,'iPhone 15','Electronics',20000000),
(2,'Samsung Refrigerator','Electronics',15000000),
(3,'Water Spinach','Food',10000),
(4,'Filtered Fresh Milk 4L','Food',28000);

UPDATE PRODUCTS
SET OriginalPrice = OriginalPrice * 0.9
WHERE Category='Electronics';

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
