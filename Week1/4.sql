

ALTER TABLE student
    ADD Nas VARCHAR(3);

ALTER TABLE student
DROP COLUMN Nas;

ALTER TABLE student
    Modify Nas INT(3);

DESCRIBE student;

# 24.7 = FLOOR(24.7) ~ 24
UPDATE student
SET nas = FLOOR(1 + (RAND() * 50))
WHERE true;

SELECT 1 + 1;

1997–2012

SELECT nas - 18 from student;