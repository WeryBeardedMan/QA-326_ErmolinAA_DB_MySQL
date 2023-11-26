USE hw_1;
CREATE TABLE IF NOT EXISTS games(
  game_name VARCHAR(50),
  gaming_date DATE,
  saving_time TIME
);

INSERT INTO games(game_name, gaming_date, saving_time)
VALUES
("Atomic Heart", "2023-10-01", "23:33:01"),
("Far Cry 5", "2023-11-12", "17:44:12"),
("Factorio", "2023-05-23", "12:05:33");

-- SELECT * FROM games;

SELECT game_name, saving_time FROM games;