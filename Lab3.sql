# Бүх багана харах бол * ашиглана
SELECT * FROM student;
# Сонгосон багана харах
SELECT Owog, Ner FROM student;
SELECT Ner, email, aimag, huis FROM student;

SELECT Ner, email, aimag, huis FROM student WHERE huis = false;

SELECT Ner, email, aimag, huis FROM student WHERE huis = true;

SELECT Ner, email, aimag, huis FROM student WHERE aimag = 'Улаанбаатар' AND huis = 0;

SELECT * FROM student WHERE T_Ognoo > '2000-01-01';

SELECT * FROM student WHERE T_Ognoo BETWEEN '1990-01-01' AND '1999-12-31';


SELECT Ner, email, aimag, huis FROM student WHERE (aimag = 'Улаанбаатар' OR huis =  1);


UPDATE student
SET aimag = 'Улаанбаатар', huis = 0
WHERE oyutan_code = 'S-008';

SELECT FLOOR(1 + (RAND() * 50)) AS random_number;

