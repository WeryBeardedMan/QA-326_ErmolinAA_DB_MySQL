
USE best_aero;

CREATE TABLE IF NOT EXISTS passengers (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name_passenger VARCHAR(30)
);
    

CREATE TABLE IF NOT EXISTS companies(
	company_name varchar (255),
    id INT PRIMARY KEY AUTO_INCREMENT
);
CREATE TABLE IF NOT EXISTS trips(
    plane VARCHAR(255),
    town_from VARCHAR (255),
    town_to VARCHAR (255),
    time_out DATETIME,
    time_in DATETIME,
    id INT PRIMARY KEY AUTO_INCREMENT,
    company INT,
    FOREIGN KEY (company) REFERENCES companies(id)
);
CREATE TABLE IF NOT EXISTS Pass_in_trip(
	id INT PRIMARY KEY AUTO_INCREMENT,
	trip INT,
     FOREIGN KEY (trip) REFERENCES trips (id),
    passenger INT,
     FOREIGN KEY (passenger) REFERENCES passengers (id),
     place VARCHAR(3)
);



-- Добавление записей в таблицу "passengers"
INSERT INTO passengers (name_passenger)
	VALUES
		('John Smith'),
		('Emma Johnson'),
		('Michael Brown'),
		('J.Sophia Williams'), -- добавил J для 6 задания
		('William Davis'),
		('Olivia Miller'),
		('James Wilson'),
		('J.Ava Martinez'), -- добавил J для 6 задания
		('Robert Anderson'),
		('Mia Garcia'), 
		('J.Sophie Brown'), -- добавил J для 6 задания
		('Liam Johnson'),
		('Charlotte Davis'),
		('Noah Martinez'),
		('Ava Smith'),
		('Ethan Wilson'),
		('Isabella Thompson'),
		('J.Mason Garcia'), -- добавил J для 6 задания
		('Olivia Clark'),
		('William Rodriguez');

-- Добавление записей в таблицу "companies"
INSERT INTO companies (company_name)
	VALUES
		('Delta Airlines'),
		('United Airlines'),
		('American Airlines'),
		('Lufthansa'),
		('Emirates'),
		('British Airways'),
		('Air France'),
		('Qatar Airways'),
		('Singapore Airlines'),
		('Cathay Pacific');

-- Добавление записей в таблицу "trips"
INSERT INTO trips (plane, town_from, town_to, time_out, time_in, company)
VALUES
		('Boeing 737', 'New York', 'Los Angeles', '2023-01-01 08:00:00', '2023-01-01 11:00:00', 1),
		('Airbus A320', 'London', 'Paris', '2023-01-02 09:00:00', '2023-01-02 10:30:00', 2),
		('Boeing 777', 'Tokyo', 'Sydney', '2023-01-03 10:00:00', '2023-01-03 22:00:00', 3),
		('Airbus A350', 'Dubai', 'Singapore', '2023-01-04 11:00:00', '2023-01-04 15:00:00', 4),
		('Boeing 787', 'Berlin', 'Moscow', '2023-01-05 12:00:00', '2023-01-05 14:30:00', 5),
		('Airbus A380', 'Rome', 'Tokyo', '2023-01-06 13:00:00', '2023-01-06 20:00:00', 6),
		('Boeing 747', 'Paris', 'Dubai', '2023-01-07 14:00:00', '2023-01-07 18:00:00', 7),
		('Airbus A330', 'Singapore', 'Hong Kong', '2023-01-08 15:00:00', '2023-01-08 16:30:00', 8),
		('Boeing 767', 'New Delhi', 'Sydney', '2023-01-09 16:00:00', '2023-01-09 23:00:00', 9),
		('Airbus A310', 'Hong Kong', 'Tokyo', '2023-01-10 17:00:00', '2023-01-10 19:30:00', 10);

----------------------------------------------------------------------------------------------------
----------------------------- добавленные тестовые данные ------------------------------------------
INSERT INTO trips (plane, town_from, town_to, time_out, time_in, company)
VALUES
		('Boeing 737', 'New York', 'Los Angeles', '2023-02-01 08:00:00', '2023-02-01 11:00:00', 1),
		('Airbus A320', 'London', 'Paris', '2023-02-02 09:00:00', '2023-02-02 10:30:00', 2),
		('Boeing 777', 'Tokyo', 'Sydney', '2023-02-03 10:00:00', '2023-02-03 22:00:00', 3),
		('Airbus A350', 'Dubai', 'Singapore', '2023-02-04 11:00:00', '2023-02-04 15:00:00', 4);
----------------------------------------------------------------------------------------------------

-- Добавление записей в таблицу "Pass_in_trip"
INSERT INTO Pass_in_trip (trip, passenger, place)
	VALUES
		(1, 1, 'A1'),
		(2, 2, 'B3'),
		(3, 3, 'C2'),
		(4, 4, 'D4'),
		(4, 15, 'F4'),
		(4, 16, 'E4'),
		(4, 17, 'A5'),
		(4, 18, 'B5'),
		(5, 5, 'E6'),
		(6, 6, 'F5'),
		(7, 7, 'G8'),
		(8, 8, 'H10'),
		(8, 11, 'B10'),
		(8, 12, 'A11'),
		(8, 13, 'C10'),
		(8, 14, 'D10'),
		(9, 9, 'I7'),
		(10, 10, 'J9');

-- --------------------------------- Запросы ----------------------------------------------

-- 1. Выбрать пассажиров и их места в рейсе:
SELECT passengers.id, name_passenger, trip, place FROM passengers
JOIN Pass_in_trip
ON passengers.id = Pass_in_trip.passenger
ORDER BY passengers.id; -- или можно отфильтровать по рейсу (ORDER BY trip), как удобнее


-- 2. Посчитать общее количество пассажиров на конкретном рейсе:
SELECT COUNT(passenger) AS 'общее количество пассажиров на рейсе', trip FROM Pass_in_trip
JOIN passengers
ON passengers.id = Pass_in_trip.passenger
AND trip = 4;

-- 3. посчитать рейсы, отправляющиеся после 2023-01-05:
SELECT COUNT(trips.id) AS 'Количество рейсов, вылетающих после 2023-01-05' FROM trips
WHERE time_out > '2023-01-05';

-- 4.  Посчитать количество рейсов, отправленных из каждого города: 
/* для наглядности добавил несколько записей в таблицу trips */
SELECT COUNT(trips.id) AS 'количество отправленных рейсов', town_from AS 'город вылета' from trips
GROUP BY town_from;

-- 5. Выбрать среднюю продолжительность рейсов для каждой компании:
SELECT AVG(TIMESTAMPDIFF(MINUTE, time_out, time_in)) AS 'средняя продолжительность рейсов в минутах', company_name FROM trips
JOIN companies
ON company = companies.id
GROUP BY company;

-- 6. Выбрать пассажиров, у которых имя начинается на 'J' и место в рейсе начинается на 'B':
/* Среди пассажиров не было ни одного, отвечающего требованиям. Немного изменил имена,
чтобы было нагляднее - добавил J к именам которые должны попадать и которые
не должны попадать в выборку */
SELECT name_passenger FROM passengers
JOIN Pass_in_trip
ON passenger = passengers.id
AND name_passenger LIKE 'J%'
AND place LIKE 'B%';

-- 7. Выбрать компании и количество рейсов, осуществленных каждой из них
SELECT companies.id, company_name, COUNT(trips.id) AS 'количество выполненных рейсов' FROM companies
JOIN trips
ON company = companies.id
GROUP BY companies.id, company_name;