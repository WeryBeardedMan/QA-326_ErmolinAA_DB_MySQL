use hw_1;

CREATE TABLE if not EXISTS teams(
  group_name VARCHAR(50),
  rating INT,
  course INT
);

INSERT INTO teams(group_name, rating, course)
VALUES
("QA-326", 7, 1),
("NA-124", 12, 3),
("Python_coding", 3, 7);

SELECT * FROM teams;

-- SELECT group_name, rating FROM teams;