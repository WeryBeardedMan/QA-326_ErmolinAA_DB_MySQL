USE hw_4;

-- Внес изменения в таблицу, добавил внешний ключ в таблицу orders, в неё же добавил столбец order_cost

CREATE TABLE IF NOT EXISTS customers
( id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  last_name CHAR(50) NOT NULL,
  first_name CHAR(50) NOT NULL,
  favorite_website CHAR(50)
);

CREATE TABLE IF NOT EXISTS orders(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	order_date DATE,
	order_cost BIGINT,
	id_orders_customers INT,
	FOREIGN KEY (id_orders_customers) REFERENCES customers (id)
);

INSERT INTO customers (last_name, first_name, favorite_website)
VALUES 	('Jackson', 'Joe', 'techonthenet.com'),
		('Smith', 'Jane', 'digminecraft.com'),
		('Ferguson', 'Samantha', 'bigactivities.com'),
		('Reynolds', 'Allen', 'checkyourmath.com'),
		('Anderson', 'Paige', NULL),
		('Johnson', 'Derek', 'techonthenet.com');

INSERT INTO orders (id_orders_customers, order_cost, order_date)
VALUES 	(1, 7000, '2016-04-18'),
		(2, 5000, '2016-04-18'),
		(3, 8000, '2016-04-19'),
		(4, 4000, '2016-04-20'),
		(5, NULL, '2016-05-01');

-- 1. Составьте запрос, где стоимость заказов больше 1000 и меньше 3000:

-- SELECT order_cost FROM orders
-- WHERE  order_cost > 1000 AND order_cost < 3000;

/* Проверил изменяя стоимость заказов - запрос работает, оставил с теми данными,
которые были в задании, с такими исходными данными - записей не ищет */

-- 2. Составьте запрос за весенние месяцы 2016 года:

-- SELECT customers.id, last_name, first_name, order_cost, order_date FROM orders, customers
-- WHERE id_orders_customers = customers.id AND YEAR(order_date) = 2016 AND (MONTH(order_date) = 3 OR MONTH(order_date) = 4 OR MONTH(order_date) = 5);

-- 3. Покажите Пользователей у кого нет заказов:

-- SELECT customers.id, last_name, first_name, order_cost, order_date FROM orders, customers
-- WHERE id_orders_customers = customers.id AND order_cost IS NULL;