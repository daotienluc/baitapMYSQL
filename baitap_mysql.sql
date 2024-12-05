CREATE DATABASE baitap_mysql

CREATE TABLE users (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	full_name VARCHAR(255),
	email VARCHAR(255),
	pass_word VARCHAR(255)
)

CREATE TABLE food_type (
	type_id INT PRIMARY KEY AUTO_INCREMENT,
	type_name VARCHAR (255)
)

CREATE TABLE food (
	food_id INT PRIMARY KEY AUTO_INCREMENT,
	food_name VARCHAR(255),
	image VARCHAR(255),
	price FLOAT,
	description VARCHAR(255),
	type_id INT,
	FOREIGN KEY (type_id) REFERENCES food_type (type_id)
)

CREATE TABLE sub_food (
	sub_id INT PRIMARY KEY AUTO_INCREMENT,
	sub_name VARCHAR(255),
	sub_price FLOAT,
	food_id INT,
	FOREIGN KEY (food_id) REFERENCES food(food_id)
)

CREATE TABLE orders (
	user_id INT ,
	food_id INT,
	amount INT,
	code VARCHAR(255),
	arr_sub_id VARCHAR(255),
	PRIMARY KEY (user_id,food_id),
	FOREIGN KEY (user_id) REFERENCES users (user_id),
	FOREIGN KEY (food_id) REFERENCES food (food_id)
)

CREATE TABLE restaurant (
	res_id INT PRIMARY KEY AUTO_INCREMENT,
	res_name VARCHAR(255),
	image VARCHAR(255),
	description VARCHAR(255)
)

CREATE TABLE rate_res(
	user_id INT,
	res_id INT,
	amount INT,
	date_rate DATETIME,
	PRIMARY KEY (user_id,res_id),
	FOREIGN KEY (user_id) REFERENCES users (user_id),
	FOREIGN KEY (res_id) REFERENCES restaurant (res_id)
)

CREATE TABLE like_res (
	user_id INT,
	res_id INT,
	date_like DATETIME,
	PRIMARY KEY (user_id,res_id),
	FOREIGN KEY (user_id) REFERENCES users (user_id),
	FOREIGN KEY (res_id) REFERENCES restaurant (res_id)
)

--INSERT DỮ LIỆU

INSERT INTO users (full_name, email, pass_word)
VALUES 
('Nguyen Van A', 'nguyenvana@gmail.com', 'password1'),
('Tran Thi B', 'tranthib@gmail.com', 'password2'),
('Le Van C', 'levanc@gmail.com', 'password3'),
('Pham Thi D', 'phamthid@gmail.com', 'password4'),
('Hoang Van E', 'hoangvane@gmail.com', 'password5'),
('Nguyen Van A', 'a@gmail.com', 'passwordA'),
('Tran Thi B', 'b@gmail.com', 'passwordB'),
('Le Van C', 'c@gmail.com', 'passwordC'),
('Pham Thi D', 'd@gmail.com', 'passwordD'),
('Hoang Van E', 'e@gmail.com', 'passwordE'),
('Hoang Van Lực', 'e@gmail.com', 'passwordE');

INSERT INTO food_type (type_name)
VALUES 
('Thức uống'),
('Đồ ăn nhanh'),
('Món tráng miệng'),
('Món chính'),
('Salad');

INSERT INTO food (food_name, image, price, description, type_id)
VALUES 
('Coca Cola', 'coca.png', 10.0, 'Thức uống giải khát', 1),
('Pizza', 'pizza.png', 100.0, 'Pizza hải sản đặc biệt', 2),
('Bánh ngọt', 'cake.png', 50.0, 'Bánh kem socola', 3),
('Cơm gà', 'chicken_rice.png', 70.0, 'Cơm gà xối mỡ', 4),
('Salad rau củ', 'salad.png', 30.0, 'Salad trộn dầu giấm', 5);

INSERT INTO sub_food (sub_name, sub_price, food_id)
VALUES 
('Đá thêm', 2.0, 1),
('Thêm phô mai', 10.0, 2),
('Thêm kem', 5.0, 3),
('Thêm trứng', 8.0, 4),
('Thêm sốt dầu giấm', 3.0, 5);

INSERT INTO orders (user_id, food_id, amount, code, arr_sub_id)
VALUES 
(1, 1, 2, 'ORDER001', '1,2'),
(2, 2, 1, 'ORDER002', '2'),
(3, 3, 3, 'ORDER003', '3'),
(4, 4, 1, 'ORDER004', '4'),
(5, 5, 2, 'ORDER005', '5'),
(1, 2, 1, 'ORDER006', '1'),
(2, 3, 2, 'ORDER007', '2,3'),
(3, 4, 1, 'ORDER008', '3'),
(4, 5, 2, 'ORDER009', '4,5'),
(5, 1, 3, 'ORDER010', '1,2,3'),
(1, 3, 1, 'ORDER011', '2'),
(2, 4, 2, 'ORDER012', '3,4'),
(3, 5, 3, 'ORDER013', '4,5'),
(4, 1, 1, 'ORDER014', '1'),
(5, 2, 2, 'ORDER015', '2,3'),
(3, 1, 3, 'ORDER013', '4,5'),
(4, 2, 1, 'ORDER014', '1'),
(5, 3, 2, 'ORDER015', '2,3');


INSERT INTO restaurant (res_name, image, description)
VALUES 
('Nhà hàng A', 'res_a.png', 'Nhà hàng chuyên món Âu'),
('Nhà hàng B', 'res_b.png', 'Nhà hàng Nhật Bản'),
('Nhà hàng C', 'res_c.png', 'Nhà hàng Hàn Quốc'),
('Nhà hàng D', 'res_d.png', 'Nhà hàng Việt Nam'),
('Nhà hàng E', 'res_e.png', 'Nhà hàng Trung Hoa');

INSERT INTO rate_res (user_id, res_id, amount, date_rate)
VALUES 
(1, 1, 5, NOW()),
(2, 2, 4, NOW()),
(3, 3, 3, NOW()),
(4, 4, 4, NOW()),
(5, 5, 5, NOW());

INSERT INTO like_res (user_id, res_id, date_like)
VALUES 
(1, 1, NOW()), (1, 2, NOW()), (1, 3, NOW()), (1, 4, NOW()), (1, 5, NOW()),
(2, 1, NOW()), (2, 2, NOW()), (2, 3, NOW()), (2, 4, NOW()),
(3, 1, NOW()), (3, 2, NOW()), (3, 3, NOW()), (3, 4, NOW()),
(4, 1, NOW()), (4, 2, NOW()), (4, 3, NOW()),
(5, 1, NOW()), (5, 2, NOW()), (5, 3, NOW()), (5, 4, NOW()), (5, 5, NOW()),
(6, 1, NOW()), (6, 2, NOW()), (6, 3, NOW());

--Truy vấn dữ liệu
-- Tìm 5 người đã like nhà hàng nhiều nhất
SELECT user_id, COUNT(res_id) AS total
FROM like_res
GROUP BY user_id
ORDER BY total DESC
LIMIT 5;

-- Tìm 2 nhà hàng có lượt like nhiều nhất
SELECT res_id , COUNT(user_id) AS total
FROM like_res
GROUP BY res_id
ORDER BY total DESC
LIMIT 2;

-- Tìm người đã đặt hàng nhiều nhất
SELECT user_id , COUNT(food_id) AS total
FROM orders
GROUP BY user_id
ORDER BY total DESC
LIMIT 1;

-- Tìm người dùng không hoạt động trong hệ thống 
SELECT users.user_id 
FROM users 
LEFT JOIN orders ON users.user_id = orders.user_id
LEFT JOIN like_res ON users.user_id = like_res.user_id
LEFT JOIN rate_res ON users.user_id = rate_res.user_id
WHERE orders.user_id IS NULL 
	AND like_res.user_id IS NULL
	AND rate_res.user_id IS NULL
















