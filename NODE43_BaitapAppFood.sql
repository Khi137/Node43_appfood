-- B1: tạo database cho website movie

create database db_movie; -- chỉ chạy 1 lần

use db_movie;

-- xóa databse
DROP DATABASE IF EXISTS db_movie; 

-- b2: tạo các table cho website movie
-- tạo table users

-- datatype:
-- number: int, bigint, double, float,...
-- chuỗi: varchar, char, ......
-- VARCHAR -> chuỗi và INT -> số

CREATE TABLE users (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(50),
	email VARCHAR(255),
	address VARCHAR(255),
	age INT
)
-- update table
-- sửa kiểu dữ liệu column, thêm mới column,...
-- case 1: sửa kiểu dữ liệu column
ALTER TABLE users
MODIFY COLUMN username VARCHAR(200)

-- TAC: 8 SỐ ĐẦU DEVICE
-- brand_name dài maximum 20 ký tự

-- table có 1 data mà brand_name dài 21 ký tự -> lỗi

-- case đặc biệt: rename column: username -> user_name
ALTER TABLE users RENAME COLUMN username TO user_name;

-- case 2: tạo column mới
ALTER TABLE users
ADD COLUMN cmnd VARCHAR(20)

-- tạo data cho table users
insert into users(username, email, address, age)
VALUES
('user1', 'user1@example.com', '123 Main St', 25),
('user2', 'user2@example.com', '456 Elm St', 30),
('user3', 'user3@example.com', '789 Oak St', 22),
('user4', 'user4@example.com', '321 Pine St', 28),
('user5', 'user5@example.com', '654 Maple St', 35),
('user6', 'user6@example.com', '987 Birch St', 27),
('user7', 'user7@example.com', '147 Cedar St', 24),
('user8', 'user8@example.com', '258 Spruce St', 29),
('user9', 'user9@example.com', '369 Aspen St', 26),
('user10', 'user10@example.com', '741 Willow St', 33),
('user11', 'user11@example.com', '852 Cypress St', 32),
('user12', 'user12@example.com', '963 Redwood St', 31),
('user13', 'user13@example.com', '159 Poplar St', 23),
('user14', 'user14@example.com', '753 Sequoia St', 34),
('user15', 'user15@example.com', '951 Fir St', 21),
('user16', 'user16@example.com', '357 Ash St', 20),
('user17', 'user17@example.com', '258 Linden St', 36),
('user18', 'user18@example.com', '951 Alder St', 27),
('user19', 'user19@example.com', '753 Hawthorn St', 29),
('user20', 'user20@example.com', '357 Chestnut St', 28)

-- kiểm tra data đã được thêm chưa
select user_name, email from users
-- lấy hết data tablse user -> dùng *

-- data -> lấy dữ liệu -> select
-- tạo dữ liệu -> insert
-- update dữ liệu -> update
-- xóa dữ liệu -> delete

SELECT * FROM users

-- update dữ liệu
update users
SET user_name = 'Nguyễn Văn C'
where email = 'user1@example.com'

-- xóa dữ liệu
DELETE from users
where email = 'user1@example.com'

-- đổi tên column trong quá trình select data
select user_name as username from users

-- lấy người có tuổi từ 20-25
-- 20 <= tuổi <= 25
-- c1: 20 <= tuổi and tuổi <= 25
-- c2: BETWEEN 20 and 25

-- c1:
select * from users
where 20 <= age and age <= 25

-- c2:
select * from users
where age BETWEEN 20 and 25

-- sắp xếp -> order by -> tăng dần (ASC), giảm dần (DESC)
select * from users
where age BETWEEN 20 and 25 -- lấy những người từ 20->25 tuổi
order by age ASC -- sắp xếp tăng dần người có độ tuổi từ 20->25
LIMIT 3 -- lấy số lượng data cho trước -> lấy 3 data

-- lấy những người có họ Tăng => LIKE
SELECT * FROM users
where user_name LIKE 'Tăng%'

-- Tăng% -> sẽ lấy tất cả những người có họ Tăng
--Ex: Tăngzxczxczxxc, Tăng123123123, Tăng Văn C, Tăng

-- %Tăng -> sẽ lấy tất cả những người có chữ Tăng sau cùng
-- czxczxcxczxczx Tăng, 12312312Tăng, Tăng

-- %Tăng% -> sẽ lấy những người có chữ Tăng

-- tìm người có tuổi lớn nhất -> MAX
select MAX(age) from users

-- tôi muốn show cả họ tên, email thì làm sao -> sub query
-- 2 bước
-- bước 1: dùng select phụ để tìm tuổi lớn nhất
-- bước 2: select những người có tuổi bằng với tuổi lớn nhất
select * from users
where age = (select MAX(age) from users)

-- khóa chính
-- thêm khóa chính cho table users
ALTER TABLE users
ADD COLUMN user_id INT PRIMARY KEY AUTO_INCREMENT

select * from users
-- thêm column user_id có kiểu INT tăng dần id
-- khóa chính không được quyền null
delete from users
where user_id = 19

insert into users(user_name, email, address, age)
VALUES
('user1', 'user1@example.com', '123 Main St', 25)

-- buổi hôm sau:
-- khóa ngoại
-- các mối quan hệ giữa các table (relationship)
-- dựa vào website có sẵn -> thiết kế database

SELECT * FROM users

-- table restaurant
CREATE TABLE restaurants(
	res_id INT PRIMARY KEY AUTO_INCREMENT,
	res_name VARCHAR(100),
	image VARCHAR(255),
	description VARCHAR(255)
)

-- tạo data 
INSERT INTO restaurants (res_name, image, description) VALUES
("Pizza Palace", "images/pizza_palace.jpg", "Delicious pizzas made with fresh ingredients and a variety of toppings."),
("Noodle Nirvana", "images/noodle_nirvana.jpg", "Authentic Asian noodle dishes with bold flavors and generous portions."),
("Taco Fiesta", "images/taco_fiesta.jpg", "Lively atmosphere with traditional and creative tacos, plus margaritas."),
("The Curry Corner", "images/curry_corner.jpg", "Exquisite Indian curries with fragrant spices and a range of vegetarian options."),
("Burger Barn", "images/burger_barn.jpg", "Classic American burgers made with juicy patties, fresh toppings, and crispy fries."),
("Sushi Symphony", "images/sushi_symphony.jpg", "Upscale sushi restaurant offering fresh seafood, creative rolls, and traditional Japanese dishes."),
("Crepe Heaven", "images/crepe_heaven.jpg", "Sweet and savory crepes made with authentic French batter and a variety of delicious fillings."),
("Happy Wok", "images/happy_wok.jpg", "Healthy and flavorful stir-fries with fresh vegetables, protein options, and homemade sauces."),
("Mamma's Kitchen", "images/mammas_kitchen.jpg", "Homestyle cooking with comforting dishes like pasta, lasagna, and slow-cooked meats."),
("The Grill House", "images/grill_house.jpg", "High-quality steaks, seafood, and other grilled specialties in an elegant setting."),
("Burrito Bandits", "images/burrito_bandits.jpg", "Large and flavorful burritos, tacos, and other Mexican favorites with fresh ingredients."),
("Pasta Paradise", "images/pasta_paradise.jpg", "Italian comfort food with a variety of pasta dishes, sauces, and fresh seafood options."),
("The Ramen Shop", "images/ramen_shop.jpg", "Authentic Japanese ramen with savory broths, perfectly cooked noodles, and customizable toppings."),
("Falafel Frenzy", "images/falafel_frenzy.jpg", "Delicious and healthy Middle Eastern cuisine featuring falafel wraps, pita bread, and fresh dips."),
("The French Table", "images/french_table.jpg", "Romantic French bistro offering classic dishes like steak frites, escargot, and decadent desserts."),
("Taco Tuesday Everyday", "images/taco_tuesday_everyday.jpg", "Casual eatery celebrating tacos every day with creative fillings, delicious salsas, and refreshing drinks."),
("Dim Sum Delight", "images/dim_sum_delight.jpg", "Traditional and innovative dim sum dishes in a vibrant and bustling atmosphere."),
("The Healthy Choice", "images/healthy_choice.jpg", "Fresh and nutritious meals with a focus on healthy ingredients, dietary needs, and delicious flavors."),
("Coffee Corner & Bakery", "images/coffee_corner_bakery.jpg", "Cozy cafe offering delicious coffee drinks, fresh-baked pastries, and light lunch options.");

-- do table users va table restaurant co quan he n-n
-- => tao table trung gian
CREATE TABLE like_res(
	like_res_id INT PRIMARY KEY AUTO_INCREMENT,
	
	-- thiet lap khoa ngoai cho column user_id
	-- va tham chieu den user_id cua table users
	user_id INT,
	FOREIGN KEY(user_id) REFERENCES users(user_id),

	res_id INT,
	FOREIGN KEY(res_id) REFERENCES restaurants(res_id),

	date_like DATE
)

-- tạo data cho table like_res
INSERT INTO like_res (user_id, res_id, date_like) VALUES
(1, 3, "2024-07-03"),  -- User 1 likes Taco Fiesta on 2024-07-03
(2, 5, "2024-06-20"),  -- User 2 likes Burger Barn on 2024-06-20
(3, 1, "2024-05-12"),  -- User 3 likes Pizza Palace on 2024-05-12
(1, 7, "2024-07-02"),  -- User 1 likes Crepe Heaven on 2024-07-02
(4, 2, "2024-06-25"),  -- User 4 likes Noodle Nirvana on 2024-06-25
(2, 10, "2024-06-18"),  -- User 2 likes The Grill House on 2024-06-18
(5, 8, "2024-07-01"),  -- User 5 likes Happy Wok on 2024-07-01
(3, 14, "2024-04-10"),  -- User 3 likes The Ramen Shop on 2024-04-10
(1, 16, "2024-06-30"),  -- User 1 likes Taco Tuesday Everyday on 2024-06-30
(4, 18, "2024-06-15")  -- User 4 likes The Healthy Choice on 2024-06-15

SELECT * FROM like_res;

-- case 1: inner join => lấy những dữ liệu có liên quan giữa 2 table
-- kinh nghiệm: sẽ table trung gian làm gốc
select * from like_res as lr
inner join restaurants as res
on lr.res_id = res.res_id

select * from restaurants as res
inner join like_res as lr
on lr.res_id = res.res_id

-- table A -> table bên trái
-- table B -> table bên phải
-- case 2: left join => lấy tất cả dữ liệu trong table A và những data
-- liên quan với table B
-- => lấy hết data của table A
select * from restaurants as res
left join like_res as lr
on lr.res_id = res.res_id

-- right join (tương tự cơ chế của left join)
-- lấy tất cả dữ liệu của table B
-- và những dữ liệu giao nhau của table A và table B
select * from restaurants as res
right join like_res as lr
on lr.res_id = res.res_id

-- tạo table rate_res
CREATE TABLE rate_res(
	rate_res_id INT PRIMARY KEY AUTO_INCREMENT,

	user_id INT,
	FOREIGN KEY(user_id) REFERENCES users(user_id),
	
	res_id INT,
	FOREIGN KEY(res_id) REFERENCES restaurants(res_id),
	
	amount INT,
	date_rate DATE
);
-- tạo data
INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES
(1, 3, 5, "2024-07-03"),  -- User 1 rates Taco Fiesta 5 stars on 2024-07-03
(2, 5, 4, "2024-06-20"),  -- User 2 rates Burger Barn 4 stars on 2024-06-20
(3, 1, 4, "2024-05-12"),  -- User 3 rates Pizza Palace 4 stars on 2024-05-12
(4, 7, 5, "2024-07-02"),  -- User 4 rates Crepe Heaven 5 stars on 2024-07-02
(1, 2, 3, "2024-06-22"),  -- User 1 rates Noodle Nirvana 3 stars on 2024-06-22
(5, 10, 5, "2024-06-19"),  -- User 5 rates The Grill House 5 stars on 2024-06-19
(3, 8, 4, "2024-07-01"),  -- User 3 rates Happy Wok 4 stars on 2024-07-01
(2, 14, 4, "2024-06-27"),  -- User 2 rates The Ramen Shop 4 stars on 2024-06-27
(4, 16, 5, "2024-06-12"),  -- User 4 rates Taco Tuesday Everyday 5 stars on 2024-06-12
(1, 18, 3, "2024-06-25"),  -- User 1 rates The Healthy Choice 3 stars on 2024-06-25

(6, 1, 5, "2024-03-15"),  -- Additional entries with different users and restaurants
(7, 9, 4, "2024-05-08"),
(8, 12, 5, "2024-04-20"),
(9, 6, 3, "2024-02-10"),
(10, 15, 4, "2024-01-25")

-- table food_type
CREATE TABLE food_type(
	type_id INT PRIMARY KEY AUTO_INCREMENT,
	type_name VARCHAR(100)
)
-- tạo data
INSERT INTO food_type (type_name) VALUES
("Italian"),
("Mexican"),
("Asian"),
("American"),
("French"),
("Mediterranean"),
("Indian"),
("Vegetarian"),
("Healthy"),
("Fast Food");

-- tạo table food
CREATE TABLE food(
	food_id INT PRIMARY KEY AUTO_INCREMENT,
	food_name VARCHAR(100),
	price FLOAT,
	image VARCHAR(255),
	description TEXT,
	
	-- foreign key
	type_id INT,
	FOREIGN KEY(type_id) REFERENCES food_type(type_id)
)
-- tạo data
INSERT INTO food (food_name, price, image, description, type_id) VALUES
("Margherita Pizza", 12.99, "images/margherita_pizza.jpg", "Classic pizza with tomato sauce, mozzarella cheese, and fresh basil.", 1),  /* Italian */
("Chicken Fajitas", 15.50, "images/chicken_fajitas.jpg", "Sizzling grilled chicken strips with peppers and onions, served with tortillas, salsa, and guacamole.", 2),  /* Mexican */
("Pad Thai", 11.75, "images/pad_thai.jpg", "Stir-fried rice noodles with chicken, vegetables, and a flavorful peanut sauce.", 3),  /* Asian */
("Cheeseburger", 9.99, "images/cheeseburger.jpg", "All-American cheeseburger with a juicy beef patty, melted cheddar cheese, lettuce, tomato, and onion on a toasted bun.", 4),  /* American */
("Ratatouille", 14.25, "images/ratatouille.jpg", "Provençal vegetable stew with eggplant, zucchini, tomatoes, and herbs.", 6),  /* Mediterranean */
("Butter Chicken", 13.95, "images/butter_chicken.jpg", "Creamy Indian curry with tender chicken in a spiced tomato gravy.", 7), /* Indian */
("Black Bean Burger", 10.50, "images/black_bean_burger.jpg", "Vegetarian burger made with black beans, corn, and spices, served on a whole wheat bun.", 8),  /* Vegetarian */
("Salmon with Roasted Vegetables", 18.75, "images/salmon_roasted_vegetables.jpg", "Grilled salmon fillet with roasted seasonal vegetables", 5),  /* French (can be considered healthy) */
("Quinoa Salad", 11.25, "images/quinoa_salad.jpg", "Healthy and flavorful salad with quinoa, vegetables, and a light vinaigrette dressing.", 9),  /* Healthy */
("Chicken Tenders", 8.99, "images/chicken_tenders.jpg", "Crispy breaded chicken tenders with dipping sauces.", 10),  /* Fast Food */
("Sushi Set", 17.50, "images/sushi_set.jpg", "Assortment of sushi pieces and nigiri.", 3),  /* Asian */
("Beef Lasagna", 14.95, "images/beef_lasagna.jpg", "Classic Italian layered pasta dish with ground beef, tomato sauce, and béchamel sauce.", 1), /* Italian */
("Tacos Al Pastor", 12.25, "images/tacos_al_pastor.jpg", "Marinated pork tacos with pineapple, onions, and cilantro.", 2), /* Mexican */
("Chicken Tikka Masala", 13.75, "images/chicken_tikka_masala.jpg", "Creamy Indian curry with marinated chicken in a tomato-based sauce.", 7), /* Indian */
("French Fries", 3.50, "images/french_fries.jpg", "Classic side dish of crispy French fries.", 10) /* Fast Food */


-- tạo table
CREATE TABLE orders(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
	
	-- khóa ngoại user_id
	user_id INT,
	FOREIGN KEY(user_id) REFERENCES users(user_id),
	
	-- khóa ngoại food_id
	food_id INT,
	FOREIGN KEY(food_id) REFERENCES food(food_id),
	
	amount INT,
	code VARCHAR(20),
	
	arr_sub_id VARCHAR(255)
)
-- tạo data
INSERT INTO orders (user_id, food_id, amount, code, arr_sub_id) VALUES
(1, 3, 2, "ORDER123", "[1,2,3]"),  -- User 1 orders 2 Margherita Pizzas (food_id 3)
(2, 5, 1, "ORDER456", "[4,2,3]"),  -- User 2 orders 1 Cheeseburger (food_id 5)
(3, 1, 1, "ORDER789", "[1,2,3]"),  -- User 3 orders 1 Pad Thai (food_id 1)
(4, 7, 3, "ORDER012", "[]"),  -- User 4 orders 3 Black Bean Burgers (food_id 7)
(1, 12, 1, "ORDER345", "[]"),  -- User 1 orders 1 Sushi Set (food_id 12)
(5, 2, 2, "ORDER678", "[]"),  -- User 5 orders 2 Chicken Fajitas (food_id 2)
(3, 8, 1, "ORDER901", "[]"),  -- User 3 orders 1 Salmon with Roasted Vegetables (food_id 8)
(2, 10, 2, "ORDER234", "[]"),  -- User 2 orders 2 Chicken Tenders (food_id 10)
(4, 14, 1, "ORDER567", "[]"),  -- User 4 orders 1 Chicken Tikka Masala (food_id 14)
(1, 4, 1, "ORDER890", "[5,6,7]"),  -- User 1 orders 1 Butter Chicken (food_id 4)
(6, 11, 1, "ORDER102", "[1]"),  -- User 6 orders 1 Quinoa Salad (food_id 11) with additional notes in arr_sub_id (replace with actual notes)
(7, 9, 2, "ORDER349", "[]"),  -- User 7 orders 2 Tacos Al Pastor (food_id 9)
(8, 6, 1, "ORDER781", "[3,7,9]"),  -- User 8 orders 1 Beef Lasagna (food_id 6)
(5, 13, 1, "ORDER092", "[]"),  -- User 5 orders 1 French Fries (food_id 13)
(9, 15, 3, "ORDER510", "[]")

select * from users
select * from like_res

-- câu 1: tìm 5 người like nhà hàng nhiều nhất
-- table: like_res, users
-- đếm số lượng record -> dùng keyword COUNT (ĐI KÈM VỚI KEYWORD GROUP BY)
-- nâng cao: 
-- Những keyword liên quan tới tổng hợp dữ liệu như: COUNT, SUM, MIN, MAX, AVG -> ĐI KÈM VỚI GROUP BY
select COUNT(lr.user_id) as count_like, u.username from like_res as lr
inner join users as u
on u.user_id = lr.user_id
GROUP BY u.username
ORDER BY COUNT(u.user_id) DESC
LIMIT 3

-- Câu 2 : tìm 2 nhà hàng có lượt like nhiều nhất
SELECT COUNT(lr.res_id) as restaurant_mostlike, res.res_name FROM like_res as lr  
inner join restaurant as res
on lr.res_id = res.res_id
GROUP BY res.res_name
ORDER BY COUNT(lr.res_id) DESC
LIMIT 2

--Câu 3 : Tìm người đã đặt hàng nhiều nhất
SELECT COUNT(o.user_id), u.user_name FROM users as u 
inner join orders as o
on u.user_id = o.user_id
GROUP BY u.user_name
ORDER BY COUNT(o.user_id) DESC
LIMIT 1

--Câu 4: Tìm người dùng không hoạt động trong hệ thống 
--(không đặt hàng, không like, không đánh giá nhà hàng)
SELECT u.user_id, u.user_name, u.email
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
LEFT JOIN like_res lr ON u.user_id = lr.user_id
LEFT JOIN rate_res rr ON u.user_id = rr.user_id
WHERE o.order_id IS NULL
  AND lr.like_res_id IS NULL
  AND rr.rate_res_id IS NULL;