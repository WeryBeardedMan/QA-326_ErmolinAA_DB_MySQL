USE hw_1;
CREATE TABLE IF NOT EXISTS weapons(
  weapons_name VARCHAR(50),
  weapons_type VARCHAR(50),
  power BIGINT
);

INSERT INTO weapons(weapons_name, weapons_type, power)
VALUES
("Words", "literature", 1000),
("Idle mind", "psychic weapons", 999999),
("Flamberg", "sword", 1);

-- SELECT * FROM weapons;

SELECT weapons_name, weapons_type FROM weapons;