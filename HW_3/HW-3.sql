USE hw_3;

CREATE TABLE IF NOT EXISTS persons(
id BIGINT PRIMARY KEY AUTO_INCREMENT,
full_name VARCHAR(255),
birth_date DATE,
sex VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS bookings(
id INT PRIMARY KEY AUTO_INCREMENT,
person_id BIGINT,
hotel_name VARCHAR(255),
hotel_type VARCHAR(255),
hotel_class INT,
cost BIGINT,
check_in_date DATE,
check_out_date DATE,
FOREIGN KEY (person_id) REFERENCES persons(id)
);

INSERT INTO persons(full_name, birth_date, sex)
VALUES ('Иванов Петр Сергеевич', '1965-11-03', 'male'),
('Нармухаммедов Салахаддин Газанович', '1976-03-25', 'male'),
('Иванова Надежда Викторовна', '1990-01-01', 'female'),
('Мельников Даниил Давидович', '1981-09-11', 'male'),
('Петровская Елена Михайловна', '2000-07-24', 'female'),
('Петров Илья Кириллович', '1990-09-27', 'male'),
('Панфилов Андрей Дмитриевич', '2002-01-20', 'male'),
('Зотов Тимофей Дмитриевич', '1990-01-17', 'male'),
('Кузьмина Алина Владимировна', '2002-07-16', 'female'),
('Иванов Илья Михайлович', '1977-02-12', 'male'),
('Романова Арина Николаевна', '1977-06-11', 'female'),
('Белова Алиса Львовна', '2003-06-08', 'female'),
('Руднева Таисия Макаровна', '2000-10-26', 'female')
;

INSERT INTO bookings(hotel_name, hotel_type, hotel_class, cost, check_in_date, check_out_date, person_id)
VALUES ('The Taleon Imperial Hotel', 'hotel', 5, 5000, '2022-12-12', '2022-12-13', 3),
('Astoria, a Rocco Forte Hotel', 'hotel', 5, 11000, '2022-05-13', '2022-05-23', 10),
('Grand Hotel Europe, Отель в Бельмонде', 'hotel', 5, 270000, '2022-11-30', '2023-01-03', 3),
('Solo Sokos Hotel Palace Bridge', 'hotel', 5,  8000, '2022-06-13', '2022-06-15', 4),
('Four Seasons Lion Palace', 'hotel', 4, 9700, '2021-07-24', '2021-08-24', 5),
('Trezzini Palace', 'hotel', 4, 7600, '2022-08-03', '2022-08-04', 6),
('Petro Palace Hotel', 'hotel', 5, 9100, '2022-01-20', '2022-01-28', 7),
('YE’S Marata', 'Apartment hotel', 3, 7300, '2022-08-21', '2022-09-07', 8),
('Kentron Boutique Hotel', 'Apartment hotel', 3, 6800, '2022-07-16' , '2022-08-16', 9),
('IZZZI у Гостиного двора', 'Apartment hotel', 4, 5000, '2022-05-13', '2022-05-18', 10),
('New Horizon Bonvita', 'Apartment hotel', 3, 5800, '2022-10-02', '2022-10-04', 11),
('Калейдоскоп GOLD', 'Apartment hotel', 3, 6200, '2022-03-17', '2022-03-17', 12),
('Capsule Hotel BARCH', 'Hostel', 2, 1500, '2022-10-26', '2022-11-07', 13),
('Baskov', 'Hostel', 1, 1600, '2022-11-12', '2022-11-15', 1),
('Star House', 'Hostel', 2, 900, '2022-03-20', '2022-03-30', 2)
;

-- SELECT * FROM bookings;
-- SELECT * FROM persons;


-- 1. Показать все бронирования и их пользователей:

-- SELECT bookings.id, hotel_type, hotel_class, cost, check_in_date, check_out_date, person_id, full_name, birth_date, sex FROM bookings, persons
-- WHERE person_id = persons.id;

-- 2. Показать оказать все бронирования стоимость которых равна 5000 и их пользователей с фамилией Иванов:

-- SELECT bookings.id, hotel_name, hotel_type, hotel_class, cost, check_in_date, check_out_date, person_id, full_name, birth_date, sex FROM bookings, persons
-- WHERE person_id = persons.id AND full_name LIKE 'Иванов %' AND cost = 5000;

-- 3. Показать всех пользователей, у которых их дата заезда совпадает с днем рождения:

-- SELECT person_id, full_name, birth_date, check_in_date FROM bookings, persons
-- WHERE person_id = persons.id AND DAY(birth_date) = DAY(check_in_date) AND MONTH(birth_date) = MONTH(check_in_date);

-- 4. Показать оказать все бронирования и их пользователей за ноябрь 2022 года:

-- SELECT bookings.id, hotel_name, hotel_type, hotel_class, cost, check_in_date, check_out_date, person_id, full_name, birth_date, sex FROM bookings, persons
-- WHERE person_id = persons.id AND (MONTH(check_in_date) = 11 OR MONTH(check_out_date) = 11) AND (YEAR(check_in_date) = 2022 OR YEAR(check_out_date) = 2022);
