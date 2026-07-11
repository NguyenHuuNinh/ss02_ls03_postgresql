CREATE DATABASE "SalesDB";
-- 1b. Tạo schema sales
CREATE SCHEMA sales;
-- 2a. Tạo bảng Customers 
CREATE TABLE sales.Customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,      -- UNIQUE đảm bảo email không trùng nhau
    phone VARCHAR(20)                        -- Cột này không có NOT NULL nên mặc định có thể bỏ trống
);

-- 2b. Tạo bảng Products 
CREATE TABLE sales.Products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price NUMERIC NOT NULL,                  -- Dùng NUMERIC cho giá tiền
    stock_quantity INTEGER NOT NULL
);

-- 2c. Tạo bảng Orders 
CREATE TABLE sales.Orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES sales.Customers(customer_id), -- Khóa ngoại tham chiếu bảng Customers
    order_date DATE NOT NULL                 -- Có thể dùng TIMESTAMP nếu muốn lưu cả giờ phút
);

-- 2d. Tạo bảng con trung gian: OrderItems 
CREATE TABLE sales.OrderItems (
    order_item_id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES sales.Orders(order_id),          -- Khóa ngoại tham chiếu bảng Orders
    product_id INTEGER REFERENCES sales.Products(product_id),    -- Khóa ngoại tham chiếu bảng Products
    quantity INTEGER NOT NULL,
    CONSTRAINT check_quantity_min CHECK (quantity >= 1)          -- Ràng buộc số lượng không được nhỏ hơn 1
);