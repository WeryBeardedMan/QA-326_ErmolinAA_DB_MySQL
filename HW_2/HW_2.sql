use hw_2_1;

CREATE TABLE IF NOT EXISTS products(
id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(255),
product_group VARCHAR(255)    
);

CREATE TABLE IF NOT EXISTS company(
id INT PRIMARY KEY AUTO_INCREMENT,
product_id INT,
company_name VARCHAR(255),
INN_number BIGINT,
KPP_number BIGINT,
organizet_form VARCHAR(255),
postal_code BIGINT,
tel_number VARCHAR(255),
email VARCHAR(255),	
FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO products(product_name, product_group)
VALUES ('laptop', 'computers'),
('monitor', 'peripherals'),
('keyboard', 'peripherals'),
('mouse pad', 'accessories'), 
('HDMI cable', 'cables'),
('SATA cable', 'cables');

INSERT INTO company(company_name, INN_number, KPP_number, organizet_form, postal_code, tel_number, email, product_id)
VALUES ('ИП Петров В.С.', 457859623145, NULL, 'ИП', 173025, '4515454', '1334berb@mail.com', 2),
('Альфа Комп', 123456789111, 456789111, 'ООО', 183025, '4581425', '1312cacc4@rambler.mi', 1),
('ИП Варфоломеева Ю.А.', 965487123654, NULL, 'ИП', 183254, '8764131', '13131acsa@rambler.su', 4),
('Гикстор', 458754332152, 812268546, 'ПАО', 183025, '9877654', 'fvwsv@vsadvs.ru', 3),
('Тыжпрограммист', 116432154611, 789512231, 'ООО', 183025, '8977431', 'we12314@mail.com', 5),
('Игростор', 864431565123, 456789111, 'ЗАО', 184254, '4586413', 'wefqwefq@rambler.mi', 6),
('Компьютер маг', 868463541321, 812268546, 'ООО', 175369, '8443354', 'ffwefv4@mail.ti', 2);

/* Запрос: найти и вывести название и email компаний, поставляющих товар 'monitor', вывести id товара 'monitor': */

-- SELECT products.id, product_name, company_name, email FROM products, company
-- WHERE product_name = 'monitor' AND products.id = product_id;

/* Запрос: найти и вывести название и id товара, а также название, номер КПП и организационную форму юридического
лица компании-поставщика и их почтовый индекс, если индекс начинается на 183: */

-- SELECT products.id, product_name, company_name, KPP_number, organizet_form, postal_code FROM products, company
-- WHERE postal_code LIKE '183%' AND products.id = product_id;

/* Запрос: найти и вывести название и id товара, организационную форму и название, а также контактную информацию компании-поставщика, у которых отстутсвует КПП
*/

-- SELECT products.id, product_name, organizet_form, company_name, KPP_number, postal_code, tel_number, email FROM products, company
-- WHERE KPP_number IS NULL AND products.id = product_id;