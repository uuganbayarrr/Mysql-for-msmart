CREATE TABLE hicheel (
    hicheel_code int(10) primary key,
    hicheel_ner varchar(20),
    kr int(1),
    uliral varchar(7),
    unmuh_holboo varchar(20),
    zaawal_eseh boolean
);

INSERT INTO hicheel (hicheel_code, hicheel_ner, kr, uliral, unmuh_holboo, zaawal_eseh)
VALUES
(201, 'Математик I', 3, 'хавар', 'None', TRUE),
(202, 'Физик I', 4, 'намар', 'Математик I', FALSE),
(203, 'Хими I', 3, 'хавар', 'None', TRUE),
(204, 'Биологи I', 2, 'намар', 'Хими I', FALSE),
(205, 'Англи хэл I', 2, 'хавар', 'None', TRUE),
(206, 'Програмчлал I', 3, 'намар', 'Математик I', TRUE),
(207, 'Мэдээллийн систем', 3, 'хавар', 'Програмчлал I', FALSE),
(208, 'Сүлжээний үндэс', 2, 'намар', 'Мэдээллийн систем', FALSE),
(209, 'Мэргэжлийн англи хэл', 2, 'хавар', 'Англи хэл I', FALSE),
(210, 'Статистик', 3, 'намар', 'Математик I', TRUE);

SELECT * FROM hicheel;

SELECT hicheel_ner, kr FROM hicheel;


SELECT * FROM hicheel WHERE uliral = 'хавар';


SELECT * FROM hicheel WHERE zaawal_eseh = TRUE;


SELECT * FROM hicheel WHERE unmuh_holboo <> 'None';


SELECT * FROM hicheel WHERE kr > 2;


SELECT * FROM hicheel ORDER BY kr DESC;


SELECT * FROM hicheel WHERE uliral = 'намар' AND zaawal_eseh = FALSE;


SELECT * FROM hicheel WHERE hicheel_ner LIKE '%I%';


SELECT uliral, COUNT(*) AS subject_count
FROM hicheel
GROUP BY uliral;
