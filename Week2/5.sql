CREATE TABLE hicheel
(
    hicheel_code int(10) primary key,
    hicheel_ner  varchar(20),
    kr           int(1),
    ulmsmartiral varchar(7),
    unmuh_holboo varchar(20),
    zaawal_eseh  boolean
);

INSERT INTO hicheel (hicheel_code, hicheel_ner, kr, uliral, unmuh_holboo, zaawal_eseh)
VALUES (201, 'Математик I', 3, 'хавар', 'None', TRUE),
       (202, 'Физик I', 4, 'намар', 'Математик I', FALSE),
       (203, 'Хими I', 3, 'хавар', 'None', TRUE),
       (204, 'Биологи I', 2, 'намар', 'Хими I', FALSE),
       (205, 'Англи хэл I', 2, 'хавар', 'None', TRUE),
       (206, 'Програмчлал I', 3, 'намар', 'Математик I', TRUE),
       (207, 'Мэдээллийн систем', 3, 'хавар', 'Програмчлал I', FALSE),
       (208, 'Сүлжээний үндэс', 2, 'намар', 'Мэдээллийн систем', FALSE),
       (209, 'Мэргэжлийн англи хэл', 2, 'хавар', 'Англи хэл I', FALSE),
       (210, 'Статистик', 3, 'намар', 'Математик I', TRUE);

SELECT *
FROM hicheel;

SELECT hicheel_ner, kr
FROM hicheel;

SELECT *
FROM hicheel
WHERE uliral <> 'хавар';


SELECT *
FROM hicheel
WHERE zaawal_eseh = TRUE;


SELECT *
FROM hicheel
WHERE unmuh_holboo <> 'None';


SELECT *
FROM hicheel
WHERE kr > 2;


SELECT hicheel_ner, kr
FROM hicheel
ORDER BY kr DESC;
SELECT hicheel_ner, kr
FROM hicheel
ORDER BY kr ASC;

SELECT ner, nas, huis
from student
where huis = true
order by nas desc;


SELECT *
FROM hicheel
WHERE uliral = 'намар'
  AND zaawal_eseh = FALSE;


SELECT *
FROM hicheel
WHERE hicheel_ner LIKE '%I%';


SELECT uliral, COUNT(*) AS subject_count
FROM hicheel
GROUP BY uliral;


SELECT *
FROM student
WHERE Ner LIKE '%Та%';

SELECT *
FROM student
WHERE Ner LIKE '%н__';

SELECT *
FROM student
WHERE T_Ognoo LIKE '____-10-__';
SELECT *
FROM student
WHERE day(T_Ognoo) = 10;
SELECT *
FROM student
WHERE month(T_Ognoo) = 10;
SELECT *
FROM student
WHERE year(T_Ognoo) = 10;

select *
from student
where mergjil like '% %';

SELECT student.Owog as 'Овог'
from student;

SELECT kr
FROM hicheel;
SELECT SUM(kr) AS niit_credit
FROM hicheel;
SELECT AVG(kr) AS dundaj_credit
FROM hicheel;
SELECT MIN(kr) AS hamgiin_baga
FROM hicheel;
SELECT MAX(kr) AS hamgiin_ih
FROM hicheel;
SELECT COUNT(*) AS niit_hicheel
FROM hicheel;
SELECT ROUND(AVG(kr), 2) AS buhni_dundaj
FROM hicheel;
SELECT UPPER(hicheel_ner) AS tom_useg
FROM hicheel;
SELECT LOWER(hicheel_ner) AS jijig_useg
FROM hicheel;
SELECT hicheel_ner, LENGTH(hicheel_ner) AS useg_count
FROM hicheel;
SELECT CONCAT(hicheel_ner, ' - ', uliral) AS tailbar
FROM hicheel;



select avg(nas)
from student
where huis = 1;
select avg(nas)
from student
where huis = 0;

SELECT ROUND(avg(nas), 2)
from student
WHERE huis = 1;

SELECT min(nas)
from student;

SELECT uliral, count(hicheel_code)
FROM hicheel
GROUP BY uliral;

SELECT kr, COUNT(*) AS too
FROM hicheel
GROUP BY kr;

SELECT zaawal_eseh, COUNT(*) AS hicheel_too
FROM hicheel
GROUP BY zaawal_eseh;

SELECT unmuh_holboo, COUNT(*) AS hicheel_too
FROM hicheel
GROUP BY unmuh_holboo;

SELECT uliral, SUM(kr) AS niit_credit
FROM hicheel
GROUP BY uliral;


SELECT kr, MIN(hicheel_ner) AS ehnii_hicheel, MAX(hicheel_ner) AS suuliin_hicheel
FROM hicheel
GROUP BY kr;

SELECT kr, uliral, COUNT(*) AS hicheel_too
FROM hicheel
GROUP BY kr, uliral;

SELECT student.aimag, avg(nas) as count
FROM student
GROUP BY aimag
ORDER BY count DESC



SELECT ner,
       FLOOR(DATEDIFF(CURRENT_DATE, T_Ognoo) / 365.25) AS nas
FROM student;


SELECT CONCAT(student.aimag, ' aimagt ', count(*), ' hun baidag bogoo hamgiin zaluu n ', min(nas), ' nasta')
from student
GROUP BY aimag;

SELECT CONCAT(student.aimag, ' aimagt ', count(*), ' hun baidag bogoo hamgiin zaluu n ',
              min(FLOOR(DATEDIFF(CURRENT_DATE, T_Ognoo) / 365.25)), ' nasta')
from student
GROUP BY aimag;