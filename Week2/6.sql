SELECT * FROM student;

SELECT * FROM hicheel;

SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE oyutan_hicheel (
    oyutan_code varchar(12) not null,
    hicheel_code int not null,
    hicheeliin_jil varchar(4),
    PRIMARY KEY (oyutan_code, hicheel_code),
    FOREIGN KEY (oyutan_code) REFERENCES student(oyutan_code),
    FOREIGN KEY (hicheel_code) REFERENCES hicheel(hicheel_code)
)
CHARSET = utf8mb3;

INSERT INTO oyutan_hicheel (oyutan_code, hicheel_code)
VALUES
 ('A-009', 201),
('A-019', 202),
('B-004', 203),
('C-002', 204),
('C-013', 205),
('E-010', 206),
('F-001', 207),
('F-012', 208),
('L-014', 209),
('M-003', 210),
('M-011', 201),
('N-007', 202),
('N-016', 203),
('P-005', 204),
('P-020', 205),
('S-008', 206),
('S-018', 207),
('T-006', 208),
('T-015', 209),
('T-017', 210);

SELECT s.Oyutan_code, s.Ner,
       COUNT(h.hicheel_code) AS num_courses
FROM student s
JOIN oyutan_hicheel oh ON s.oyutan_code = oh.oyutan_code
JOIN hicheel h ON oh.hicheel_code = h.hicheel_code
GROUP BY s.Oyutan_code, s.Ner, s.Urgiin_owog, s.Owog, s.huis, s.aimag, s.sum, s.mergjil;

SELECT s.Ner AS Student_Name, s.Urgiin_owog AS First_Name, s.Owog AS Last_Name, h.hicheel_ner AS Course_Name
FROM student s
JOIN oyutan_hicheel oh ON s.oyutan_code = oh.oyutan_code
JOIN hicheel h ON oh.hicheel_code = h.hicheel_code;


SELECT 
    s.Ner AS Student_Name, 
    s.Owog AS Last_Name, 
    h.hicheel_ner AS Course_Name
FROM 
    student s
JOIN 
    oyutan_hicheel oh ON s.oyutan_code = oh.oyutan_code
JOIN 
    hicheel h ON oh.hicheel_code = h.hicheel_code;



SELECT 
    s.Ner AS Student_Name, 
    s.Owog AS Last_Name
FROM 
    student s
JOIN 
    oyutan_hicheel oh ON s.oyutan_code = oh.oyutan_code
JOIN 
    hicheel h ON oh.hicheel_code = h.hicheel_code
WHERE 
    h.hicheel_ner = 'Математик I';


SELECT 
    s.Ner AS Student_Name, 
    s.Owog AS Last_Name
FROM 
    student s
LEFT JOIN 
    oyutan_hicheel oh ON s.oyutan_code = oh.oyutan_code
LEFT JOIN 
    hicheel h ON oh.hicheel_code = h.hicheel_code
WHERE 
    h.hicheel_ner IS NULL;

SELECT 
    h.hicheel_ner AS Course_Name, 
    COUNT(s.oyutan_code) AS Number_of_Students
FROM 
    hicheel h
JOIN 
    oyutan_hicheel oh ON h.hicheel_code = oh.hicheel_code
JOIN 
    student s ON oh.oyutan_code = s.oyutan_code
GROUP BY 
    h.hicheel_ner;

SELECT 
    s.Ner AS Student_Name, 
    s.Owog AS Last_Name, 
    h.hicheel_ner AS Course_Name, 
    h.unmuh_holboo AS Instructor
FROM 
    student s
JOIN 
    oyutan_hicheel oh ON s.oyutan_code = oh.oyutan_code
JOIN 
    hicheel h ON oh.hicheel_code = h.hicheel_code;

SELECT 
    s.Ner AS Student_Name, 
    COUNT(h.hicheel_code) AS Number_of_Courses
FROM 
    student s
JOIN 
    oyutan_hicheel oh ON s.oyutan_code = oh.oyutan_code
JOIN 
    hicheel h ON oh.hicheel_code = h.hicheel_code
GROUP BY 
    s.oyutan_code
HAVING 
    COUNT(h.hicheel_code) > 1;
