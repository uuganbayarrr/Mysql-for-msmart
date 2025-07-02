CREATE DATABASE zhzb;
use zhzb;
-- 1. ezemshgch (Owner)
CREATE TABLE ezemshgch (
    EzemshigchRD CHAR(10) PRIMARY KEY,
    Ner VARCHAR(20) NOT NULL,
    Owog VARCHAR(20) NOT NULL,
    Hayag VARCHAR(50),
    Utas VARCHAR(8),
    unemleh VARCHAR(8) UNIQUE
);

-- 2. uildverlegch (Operator)
CREATE TABLE uildverlegch (
     uildverlegchId tinyint(4) PRIMARY KEY,
     uildverlegchNer varchar(20)
);

-- 3. mark (Car Brand)
CREATE TABLE mark (
    markcode TINYINT(4) PRIMARY KEY,
    markNer VARCHAR(20) NOT NULL,
    uildverCode tinyint(4),
    FOREIGN KEY (uildverCode) REFERENCES uildverlegch(uildverlegchId)
);

-- 4. ungu (Color)
CREATE TABLE ungu (
    unguId TINYINT(4) PRIMARY KEY,
    unguNer VARCHAR(20) NOT NULL,
    unguHex VARCHAR(10)
);

-- 5. angilal (Vehicle Type)
CREATE TABLE angilal (
    angilalId TINYINT(4) PRIMARY KEY,
    angilalNer VARCHAR(20) NOT NULL
);

-- 6. duureg (District)
CREATE TABLE duureg (
    duuregId TINYINT(4) PRIMARY KEY,
    duuregNer VARCHAR(20) NOT NULL
);

-- 7. horoo (Neighborhood)
CREATE TABLE horoo (
    horooId TINYINT(4) PRIMARY KEY,
    horooNer VARCHAR(20) NOT NULL,
    duuregCode TINYINT(4),
    FOREIGN KEY (duuregCode) REFERENCES duureg(duuregId)
);

-- 8. camer (Camera)
CREATE TABLE camer (
    camerId VARCHAR(8) PRIMARY KEY,
    camerBairshil VARCHAR(50) NOT NULL,
    horooCode TINYINT(4),
    FOREIGN KEY (horooCode) REFERENCES horoo(horooId)
);

-- 9. zxtx (Violation Type)
CREATE TABLE zxtx (
    Id TINYINT(4) PRIMARY KEY,
    tailbar VARCHAR(50) NOT NULL,
    zaalt VARCHAR(10) NOT NULL,
    dans VARCHAR(10) NOT NULL,
    tulbur int(11) NOT NULL
);

-- 10. mashin (Vehicle)
CREATE TABLE mashin (
    plateNo VARCHAR(7) PRIMARY KEY,
    markcode TINYINT(4),
    angilalCode TINYINT(4),
    unguCode TINYINT(4),
    EzemshigchRD CHAR(10),
    FOREIGN KEY (markcode) REFERENCES mark(markcode),
    FOREIGN KEY (angilalCode) REFERENCES angilal(angilalId),
    FOREIGN KEY (unguCode) REFERENCES ungu(unguId),
    FOREIGN KEY (EzemshigchRD) REFERENCES ezemshgch(EzemshigchRD)
);

-- 11. zorchilburtgel (Violation Record)
CREATE TABLE zorchilburtgel (
    burgeilId INT(11) PRIMARY KEY AUTO_INCREMENT,
    ognoo DATETIME NOT NULL,
    camerCode VARCHAR(8),
    duremCode TINYINT(4),
    mashinDugaar VARCHAR(7),
    FOREIGN KEY (camerCode) REFERENCES camer(camerId),
    FOREIGN KEY (duremCode) REFERENCES zxtx(Id),
    FOREIGN KEY (mashinDugaar) REFERENCES mashin(plateNo)
);

USE zhzb;

-- 1. Insert into ezemshgch (Owners)
INSERT INTO ezemshgch (EzemshigchRD, Ner, Owog, Hayag, Utas, unemleh)
VALUES ('RD10000001', 'Bat', 'Bold', 'Khan-Uul 15-1', '99112233', 'A1000001'),
       ('RD10000002', 'Dorj', 'Ganbaatar', 'Sukhbaatar 12-5', '99223344', 'A1000002'),
       ('RD10000003', 'Tsetseg', 'Oyun', 'Bayangol 8-10', '99334455', 'A1000003'),
       ('RD10000004', 'Bold', 'Erdenebat', 'Bayanzurkh 20-3', '99445566', 'A1000004'),
       ('RD10000005', 'Saruul', 'Narantuya', 'Chingeltei 5-7', '99556677', 'A1000005');

-- 2. Insert into uildverlegch (Manufacturers)
INSERT INTO uildverlegch (uildverlegchId, uildverlegchNer)
VALUES (1, 'Toyota'),
       (2, 'Hyundai'),
       (3, 'Chevrolet'),
       (4, 'BMW'),
       (5, 'Honda');

-- 3. Insert into mark (Car Models)
INSERT INTO mark (markcode, markNer, uildverCode)
VALUES (1, 'Prius', 1),
       (2, 'Camry', 1),
       (3, 'Accent', 2),
       (4, 'Tucson', 2),
       (5, 'Malibu', 3),
       (6, 'Silverado', 3),
       (7, 'X5', 4),
       (8, '3 Series', 4),
       (9, 'Civic', 5),
       (10, 'CR-V', 5),
       (101, 'ChevyBolt', 3),
       (102, 'Prius V', 1),
       (103, 'Prius C', 1),
       (104, 'Prius Prime', 1),
       (105, 'Yaris', 1),
       (106, 'Avalon', 1),
       (107, 'Alpina D5 S', 4);

-- 4. Insert into ungu (Colors)
INSERT INTO ungu (unguId, unguNer, unguHex)
VALUES (1, 'White', '#FFFFFF'),
       (2, 'Black', '#000000'),
       (3, 'Silver', '#C0C0C0'),
       (4, 'Red', '#FF0000'),
       (5, 'Blue', '#0000FF'),
       (6, 'Green', '#00FF00'),
       (7, 'Yellow', '#FFFF00'),
       (8, 'Gray', '#808080');

-- 5. Insert into angilal (Vehicle Types)
INSERT INTO angilal (angilalId, angilalNer)
VALUES (1, 'Sedan'),
       (2, 'SUV'),
       (3, 'Truck'),
       (4, 'Hatchback'),
       (5, 'Coupe'),
       (6, 'Minivan');

-- 6. Insert into duureg (Districts)
INSERT INTO duureg (duuregId, duuregNer)
VALUES (1, 'Khan-Uul'),
       (2, 'Sukhbaatar'),
       (3, 'Bayangol'),
       (4, 'Bayanzurkh'),
       (5, 'Chingeltei'),
       (6, 'Songinokhairkhan');

-- 7. Insert into horoo (Neighborhoods)
INSERT INTO horoo (horooId, horooNer, duuregCode)
VALUES (1, '1-r good', 1),
       (2, '2-r good', 1),
       (3, '3-r good', 2),
       (4, '4-r good', 2),
       (5, '5-r good', 3),
       (6, '6-r good', 3),
       (7, '7-r good', 4),
       (8, '8-r good', 4),
       (9, '9-r good', 5),
       (10, '10-r good', 5),
       (11, '11-r good', 6),
       (12, '12-r good', 6);

-- 8. Insert into camer (Cameras)
INSERT INTO camer (camerId, camerBairshil, horooCode)
VALUES ('CAM00001', 'Peace Ave - Seoul St intersection', 1),
       ('CAM00002', 'Sambuu St - Olympic St intersection', 2),
       ('CAM00003', 'Chinggis Ave - United Nations St intersection', 3),
       ('CAM00004', 'Narnii Rd - Zaisan intersection', 4),
       ('CAM00005', 'Khan-Uul District Center', 5),
       ('CAM00006', 'Sukhbaatar Square East', 6),
       ('CAM00007', 'Bayangol District Main', 7),
       ('CAM00008', 'Narantuya St - Bayanzurkh intersection', 8),
       ('CAM00009', 'Chingeltei District Office', 9),
       ('CAM00010', 'Dund gol intersection', 10),
       ('CAM00011', '11-r goodol uulzvar', 11);

-- 9. Insert into zxtx (Violation Types)
INSERT INTO zxtx (Id, tailbar, zaalt, dans, tulbur)
VALUES (1, 'Speeding (20-40 km/h over limit)', '301.1', '6.1', 50000),
       (2, 'Speeding (40+ km/h over limit)', '301.2', '6.2', 100000),
       (3, 'Running red light', '302.1', '6.3', 150000),
       (4, 'Illegal parking', '303.1', '6.4', 30000),
       (5, 'Wrong way driving', '304.1', '6.5', 200000),
       (6, 'No seatbelt', '305.1', '6.6', 50000),
       (7, 'Using mobile phone while driving', '306.1', '6.7', 100000),
       (8, 'Drunk driving', '307.1', '6.8', 500000);

-- 10. Insert into mashin (Vehicles)
INSERT INTO mashin (plateNo, markcode, angilalCode, unguCode, EzemshigchRD)
VALUES ('ABC1234', 7, 2, 2, 'RD10000001'),   -- Black BMW X5
       ('DEF5678', 2, 1, 1, 'RD10000002'),   -- White Toyota Camry
       ('GHI9012', 9, 1, 5, 'RD10000003'),   -- Blue Honda Civic
       ('JKL3456', 4, 2, 3, 'RD10000004'),   -- Silver Hyundai Tucson
       ('MNO7890', 6, 3, 2, 'RD10000005'),   -- Black Chevrolet Silverado
       ('PQR1234', 1, 1, 4, 'RD10000001'),   -- Red Toyota Prius
       ('STU5678', 107, 1, 2, 'RD10000002'), -- Black BMW Alpina D5 S
       ('VWX9012', 101, 4, 6, 'RD10000003'), -- Green ChevyBolt
       ('YZA3456', 105, 4, 7, 'RD10000004'), -- Yellow Toyota Yaris
       ('BCD7890', 106, 1, 8, 'RD10000005');
-- Gray Toyota Avalon

-- 11. Insert into zorchilburtgel (Violation Records)
-- Correct the invalid datetime values in zorchilburtgel inserts
INSERT INTO zorchilburtgel (ognoo, camerCode, duremCode, mashinDugaar)
VALUES ('2023-01-15 08:23:45', 'CAM00001', 1, 'ABC1234'),
       ('2023-01-16 12:34:56', 'CAM00002', 3, 'DEF5678'),
       ('2023-01-17 17:45:23', 'CAM00003', 4, 'GHI9012'),
       ('2023-01-18 09:12:34', 'CAM00004', 2, 'JKL3456'),
       ('2023-01-19 14:56:07', 'CAM00005', 5, 'MNO7890'), -- Changed from 14:56:78 to 14:56:07
       ('2023-01-20 07:34:12', 'CAM00006', 6, 'PQR1234'),
       ('2023-01-21 16:45:23', 'CAM00007', 7, 'STU5678'),
       ('2023-01-22 11:23:45', 'CAM00008', 8, 'VWX9012'),
       ('2023-01-23 13:34:56', 'CAM00009', 1, 'YZA3456'),
       ('2023-01-24 18:45:12', 'CAM00010', 3, 'BCD7890'),
       ('2023-01-25 10:12:34', 'CAM00001', 4, 'ABC1234'),
       ('2023-01-26 15:23:45', 'CAM00002', 2, 'DEF5678'),
       ('2023-01-27 19:34:56', 'CAM00011', 5, 'GHI9012');


SELECT zb.burgeilId,
       zb.ognoo,
       m.plateNo,
       mk.markNer,
       uild.uildverlegchNer,
       ung.unguNer,
       ez.Ner  AS ownerNer,
       ez.Owog AS ownerOwog,
       cam.camerBairshil,
       z.tailbar,
       z.tulbur
FROM zorchilburtgel zb
         JOIN mashin m ON zb.mashinDugaar = m.plateNo
         JOIN ezemshgch ez ON m.EzemshigchRD = ez.EzemshigchRD
         JOIN mark mk ON m.markcode = mk.markcode
         JOIN uildverlegch uild ON mk.uildverCode = uild.uildverlegchId
         JOIN ungu ung ON m.unguCode = ung.unguId
         JOIN camer cam ON zb.camerCode = cam.camerId
         JOIN zxtx z ON zb.duremCode = z.Id
WHERE zb.burgeilId = 27;


ALTER TABLE mashin
    DROP FOREIGN KEY mashin_ibfk_1;

ALTER TABLE mashin
    ADD CONSTRAINT fk_mark
        FOREIGN KEY (markcode) REFERENCES mark (markcode)
            ON DELETE CASCADE;


alter table angilal
    modify angilalNer varchar(20) not null;

DESCRIBE angilal;

SELECT * FROM zxtx;

SELECT * from mashin;

DELETE FROM mark WHERE markcode = 7;


ALTER TABLE zorchilburtgel DROP FOREIGN KEY zorchilburtgel_ibfk_3;

ALTER TABLE zorchilburtgel
ADD CONSTRAINT fk_mashin
FOREIGN KEY (mashinDugaar) REFERENCES mashin(plateNo)
ON DELETE CASCADE;

SELECT
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
    REFERENCED_TABLE_SCHEMA = 'zhzb'
    AND REFERENCED_TABLE_NAME IS NOT NULL;

DESCRIBE mashin;

SET @var1 = 'uuganbayar';
SET @var2 = 'bold';

SELECT @var1, @var2 from dual;



