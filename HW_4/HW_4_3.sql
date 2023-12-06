
-- В таблице FamalyMembers изменил тип данных столбца birthday на DATE, т.к. в DATATIME не увидел смысла при указании даты рождения

CREATE DATABASE IF NOT EXISTS family;
USE family;

CREATE TABLE IF NOT EXISTS GoodTypes(
good_type_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
good_type_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Goods(
good_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
good_name VARCHAR(50),
type_ INT NOT NULL,
FOREIGN KEY (type_) REFERENCES GoodTypes(good_type_id)
);

CREATE TABLE IF NOT EXISTS FamalyMembers(
member_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
status_ VARCHAR(30),
member_name VARCHAR (50),
birthday DATE
);

CREATE TABLE IF NOT EXISTS Payments(
payment_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
family_member INT NOT NULL,
good INT NOT NULL,
amount INT NOT NULL,
unit_price INT NOT NULL,
date_ DATETIME,
FOREIGN KEY (family_member) REFERENCES FamalyMembers(member_id),
FOREIGN KEY (good) REFERENCES Goods(good_id)
);

INSERT INTO FamalyMembers (status_, member_name, birthday)
VALUES 	('mother', 'Kirstyn Hutcheon', '1981-02-23'),
		('father', 'Kylen Hutcheon', '1983-03-30'),
		('daughter', 'Pippa Hutcheon', '2005-08-18'),
		('father', 'Yurik Guittet', '1989-08-31'),
		('mother', 'Marielle Guittet', '1978-04-27'),
		('daughter', 'Jacquenetta Guittet', '2013-01-21'),
		('son', 'Quintus Guittet', '2007-10-20'),
		('father', 'Paxon Johnigan', '1968-04-21'),
		('mother', 'Eloise Johnigan', '1975-11-13'),
		('daughter', 'Elyse Johnigan', '1998-09-27'),
		('mother', 'Brittany Keeling', '1970-06-12'),
		('father', 'Amory Keeling', '1974-04-01'),
		('son', 'Palmer Keeling', '1994-11-25'),
		('daughter', 'Chandra Keeling', '2003-08-01');

INSERT INTO GoodTypes (good_type_name)
VALUES 	('vegetables'),
		('fruits'),
		('snacks'),
		('meat'),
		('fish'),
		('drinks');

INSERT INTO Goods (good_name, type_)
VALUES 	('potato', 1),
		('carrot', 1),
		('apple juice', 6),
		('beef steak', 4),
		('trout', 5),
        ('apple', 2),
		('potato chips', 3);

INSERT INTO Payments (family_member, good, amount, unit_price, date_)
VALUES 	(1, 1, 1500, 36, '2023-12-01 01:00:00'),
		(2, 2, 2000, 20, '2023-12-02 02:00:00'),
		(3, 3, 5678, 15, '2023-12-03 03:00:00'),
		(4, 6, 3000, 14, '2023-12-04 04:00:00'),
		(5, 7, 4000, 145, '2023-12-05 05:00:00'),
		(6, 1, 1200, 59, '2023-12-06 06:00:00'),
		(7, 2, 1100, 56, '2023-11-01 07:00:00'),
		(8, 3, 999, 47, '2023-10-01 08:00:00'),
		(9, 1, 1569, 560, '2023-09-01 09:00:00'),
		(10, 6, 1235, 23, '2023-08-01 10:00:00'),
		(11, 7, 123, 11, '2023-07-01 11:00:00'),
		(12, 1, 4565, 7, '2023-06-01 12:00:00'),
		(13, 2, 12000, 1251, '2023-05-01 13:00:00'),
		(14, 3, 1458, 325, '2023-04-01 14:00:00');

-- 1. Найти имена всех матерей (mother):

-- SELECT member_name AS 'Имена матерей' FROM FamalyMembers
-- WHERE status_ = 'mother';

-- 2. Определить, кто из членов семьи покупал картошку (potato):

-- SELECT member_name AS 'potato купили', status_ FROM FamalyMembers, Goods, Payments
-- WHERE Payments.family_member = FamalyMembers.member_id AND Payments.good = Goods.good_id
-- AND good_name = 'potato';

-- 3. Определить какие товары не были куплены:

-- SELECT good_name AS 'Не куплено' FROM goods
-- WHERE good_id NOT IN (SELECT good FROM payments WHERE payments.good = goods.good_id);
