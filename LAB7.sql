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