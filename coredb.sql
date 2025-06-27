-- Table 1: Professor
create table professor
(
    professor_code int not null primary key,
    professor_name varchar(255) null
)
    charset = utf8mb4;

-- Table 2: mergjil (Research)
create table mergjil
(
    mergjil_index int not null primary key,
    mergjil_ner varchar(255) null,
    bagsh_dugaar int null,
    constraint mergjil_ibfk_1 foreign key (bagsh_dugaar) references professor (professor_code)
)
    charset = utf8mb4;

-- Table 3: Bagsh (Department)
create table bagsh
(
    bagsh_code int not null primary key,
    bagsh_ner varchar(255) null
)
    charset = utf8mb4;

-- Table 4: Bagsh dugaar (Department Assignment)
create table bagsh_dugaar
(
    professor_code int not null,
    bagsh_code int not null,
    constraint bagsh_dugaar_ibfk_1 foreign key (professor_code) references professor (professor_code),
    constraint bagsh_dugaar_ibfk_2 foreign key (bagsh_code) references bagsh (bagsh_code),
    primary key (professor_code, bagsh_code)
)
    charset = utf8mb4;

-- Table 5: Student Hicheel (Student Courses)
create table student_hicheel
(
    student_code varchar(12) not null,
    hicheel_code int not null,
    hicheeliin_jil varchar(4) null,
    constraint student_hicheel_ibfk_1 foreign key (student_code) references student (oyutan_code),
    constraint student_hicheel_ibfk_2 foreign key (hicheel_code) references hicheel (hicheel_code),
    primary key (student_code, hicheel_code)
)
    charset = utf8mb4;

create index student_code_idx on student_hicheel (student_code);
create index hicheel_code_idx on student_hicheel (hicheel_code);

-- Table 6: Hicheel (Course)
create table hicheel
(
    hicheel_code int not null primary key,
    hicheel_ner varchar(255) null,
    kr int null,
    uliral varchar(7) null,
    unmuh_holboo varchar(20) null,
    zaawal_eseh tinyint(1) null
)
    charset = utf8mb4;

-- Table 7: Oyutan (Student)
create table student
(
    RD varchar(10) null,
    Urgiin_owog varchar(255) null,
    Owog varchar(255) null,
    Ner varchar(255) null,
    huis tinyint(1) null,
    T_Ognoo date null,
    undes varchar(255) null,
    aimag varchar(50) null,
    sum varchar(50) null,
    geriin_hayg varchar(255) null,
    geriin_utas varchar(8) null,
    email varchar(255) null,
    mergjil varchar(255) null,
    oyutan_code varchar(12) not null primary key,
    Nas int null
)
    charset = utf8mb4;
INSERT INTO mergjil (mergjil_index, mergjil_ner, bagsh_dugaar) VALUES
(1, 'Биологийн судалгаа', 1),
(2, 'Түүхийн судалгаа', 2),
(3, 'Социологийн судалгаа', 3),
(4, 'Нийгмийн судалгаа', 4),
(5, 'Нөхөн сэргээлт судалгаа', 5),
(6, 'Эрүүл мэндийн судалгаа', 6),
(7, 'Үйлдвэрлэлийн судалгаа', 7),
(8, 'Урлаг судалгаа', 8),
(9, 'Геологийн судалгаа', 9),
(10, 'Газар зүйн судалгаа', 10),
(11, 'Санхүүгийн судалгаа', 11),
(12, 'Менежментийн судалгаа', 12),
(13, 'Зах зээлийн судалгаа', 13),
(14, 'Математикийн судалгаа', 14),
(15, 'Шинжлэх ухааны судалгаа', 15),
(16, 'Хими судалгаа', 16),
(17, 'Физикийн судалгаа', 17),
(18, 'Кибер аюулгүй байдал судалгаа', 18),
(19, 'Харилцаа холбооны судалгаа', 19),
(20, 'Технологийн судалгаа', 20);

INSERT INTO professor (professor_code, professor_name) VALUES
(1, 'Г. Бат-Эрдэнэ'),
(2, 'Д. Төмөрбаатар'),
(3, 'С. Болормаа'),
(4, 'Б. Ганболд'),
(5, 'Ч. Батцэцэг'),
(6, 'О. Энхсаран'),
(7, 'Ж. Төгөлдөр'),
(8, 'Э. Алтан-Өлзий'),
(9, 'Н. Сувд'),
(10, 'Л. Төмөр'),
(11, 'М. Батсайхан'),
(12, 'А. Нарангэрэл'),
(13, 'Т. Шарав'),
(14, 'Д. Нямдорж'),
(15, 'Р. Ганбат'),
(16, 'Ж. Энхжаргал'),
(17, 'Э. Гантуяа'),
(18, 'Б. Байгаль'),
(19, 'Т. Хишигсүрэн'),
(20, 'З. Хулан');


INSERT INTO bagsh (bagsh_code, bagsh_ner) VALUES
(1, 'Биологийн багш'),
(2, 'Түүхийн багш'),
(3, 'Социологийн багш'),
(4, 'Нийгмийн багш'),
(5, 'Нөхөн сэргээлт багш'),
(6, 'Эрүүл мэндийн багш'),
(7, 'Үйлдвэрлэлийн багш'),
(8, 'Урлагийн багш'),
(9, 'Геологийн багш'),
(10, 'Газар зүйн багш'),
(11, 'Санхүүгийн багш'),
(12, 'Менежментийн багш'),
(13, 'Зах зээлийн багш'),
(14, 'Математикийн багш'),
(15, 'Шинжлэх ухааны багш'),
(16, 'Хими багш'),
(17, 'Физикийн багш'),
(18, 'Кибер аюулгүй байдал багш'),
(19, 'Харилцаа холбооны багш'),
(20, 'Технологийн багш');
INSERT INTO bagsh_dugaar (professor_code, bagsh_code) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

INSERT INTO student_hicheel (student_code, hicheel_code, hicheeliin_jil) VALUES
('STU001', 1, '2023'),
('STU002', 2, '2023'),
('STU003', 3, '2023'),
('STU002', 4, '2023'),
('STU002', 5, '2023'),
('STU002', 6, '2023'),
('STU002', 7, '2023'),
('STU002', 8, '2023'),
('STU002', 9, '2023'),
('STU012', 10, '2023'),
('STU012', 11, '2023'),
('STU011', 12, '2023'),
('STU011', 13, '2023'),
('STU011', 14, '2023'),
('STU011', 15, '2023'),
('STU011', 16, '2023'),
('STU011', 17, '2023'),
('STU013', 18, '2023'),
('STU012', 19, '2023'),
('STU021', 20, '2023');

INSERT INTO hicheel (hicheel_code, hicheel_ner, kr, uliral, unmuh_holboo, zaawal_eseh) VALUES
(1, 'Биологи', 3, 'Биеийн', 'Зарим хичээл', 1),
(2, 'Түүх', 2, 'Урлагийн', 'Түүхийн шинжлэх ухаан', 0),
(3, 'Социологи', 4, 'Нийгэм', 'Нийгэмд үйлдсэн судалгаа', 1),
(4, 'Нийгмийн ухаан', 3, 'Нийгэм', 'Багшийн хичээл', 0),
(5, 'Нөхөн сэргээлт', 3, 'Газар', 'Байгаль орчны судалгаа', 1),
(6, 'Эрүүл мэндийн ухаан', 2, 'Эрүүл мэнд', 'Эрүүл амьдралын хичээл', 0),
(7, 'Үйлдвэрлэлийн хичээл', 3, 'Аж үйлдвэрлэл', 'Ажлын орчинд судалгаа', 1),
(8, 'Урлагийн хичээл', 2, 'Соёл', 'Урлагийн судалгаа', 0),
(9, 'Геологийн хичээл', 4, 'Газрын бүтэц', 'Шинжлэх ухааны хичээл', 1),
(10, 'Газар зүйн хичээл', 3, 'Газар орон', 'Тусгай нөхцөл', 0),
(11, 'Санхүүгийн хичээл', 5, 'Эдийн засаг', 'Мөнгөн санхүү', 1),
(12, 'Менежментийн хичээл', 3, 'Бизнес', 'Худалдаа өргөжүүлэх', 0),
(13, 'Зах зээлийн хичээл', 4, 'Эдийн засаг', 'Зах зээлийн өрсөлдөөн', 1),
(14, 'Математикийн хичээл', 4, 'Математик', 'Тоо бодол', 0),
(15, 'Шинжлэх ухааны хичээл', 3, 'Шинжлэх ухаан', 'Үнэлгээ судалгаа', 1),
(16, 'Хими хичээл', 4, 'Хими', 'Орчны хими', 0),
(17, 'Физикийн хичээл', 3, 'Физик', 'Гүйцэтгэл', 1),
(18, 'Кибер аюулгүй байдал хичээл', 4, 'Технологи', 'Компьютерийн хамгаалалт', 1),
(19, 'Харилцаа холбооны хичээл', 3, 'Утас', 'Телевизийн харилцаа', 0),
(20, 'Технологийн хичээл', 3, 'Хэрэглээ', 'Технологийн хөгжүүлэлт', 1);

INSERT INTO student (RD, Urgiin_owog, Owog, Ner, huis, T_Ognoo, undes, aimag, sum, geriin_hayg, geriin_utas, email, mergjil, oyutan_code, Nas) VALUES
('RD001', 'Алтан', 'Бат', 'Б. Алтанбат', 1, '2000-01-01', 'Монгол', 'Улаанбаатар', 'Хан-Уул', 'Чингисийн гудамж', '70123456', 'email1@example.com', 'Биологич', 'STU001', 25),
('RD002', 'Ганболд', 'Сарантуяа', 'Г. Сарантуяа', 2, '2001-02-01', 'Монгол', 'Улаанбаатар', 'Баянгол', 'Баянголын гудамж', '70123457', 'email2@example.com', 'Түүхч', 'STU002', 24),
('RD003', 'Төмөр', 'Чимэдсүрэн', 'Т. Чимэдсүрэн', 1, '1999-03-01', 'Монгол', 'Ховд', 'Ховд', 'Дэлгэрмөрөн', '70123458', 'email3@example.com', 'Социологич', 'STU003', 26),

SELECT 
    s.oyutan_code,
    s.Ner AS student_name,
    s.email,
    sh.hicheel_code,
    h.hicheel_ner,
    sh.hicheeliin_jil
FROM 
    student s
JOIN 
    student_hicheel sh ON s.oyutan_code = sh.student_code
JOIN 
    hicheel h ON sh.hicheel_code = h.hicheel_code;

SELECT 
    p.professor_code,
    p.professor_name,
    b.bagsh_ner AS department_name
FROM 
    professor p
JOIN 
    bagsh_dutaar bd ON p.professor_code = bd.professor_code
JOIN 
    bagsh b ON bd.bagsh_code = b.bagsh_code;

SELECT 
    m.marzugjl_index,
    m.marzugjl_ner AS research_topic,
    p.professor_name
FROM 
    marzugjl m
JOIN 
    professor p ON m.bagsh_dutaar = p.professor_code;

SELECT 
    s.oyutan_code,
    s.Ner AS student_name,
    sh.hicheel_code,
    h.hicheel_ner AS course_name,
    m.marzugjl_ner AS research_topic
FROM 
    student s
JOIN 
    student_hicheel sh ON s.oyutan_code = sh.student_code
JOIN 
    hicheel h ON sh.hicheel_code = h.hicheel_code
JOIN 
    marzugjl m ON h.hicheel_code = m.marzugjl_index;

SELECT 
    p.professor_name,
    b.bagsh_ner AS department_name,
    h.hicheel_ner AS course_name
FROM 
    professor p
JOIN 
    bagsh_dutaar bd ON p.professor_code = bd.professor_code
JOIN 
    bagsh b ON bd.bagsh_code = b.bagsh_code
JOIN 
    hicheel h ON bd.bagsh_code = h.hicheel_code;

SELECT 
    s.Ner AS student_name,
    h.hicheel_ner AS course_name,
    p.professor_name
FROM 
    student s
JOIN 
    student_hicheel sh ON s.oyutan_code = sh.student_code
JOIN 
    hicheel h ON sh.hicheel_code = h.hicheel_code
JOIN 
    marzugjl m ON h.hicheel_code = m.marzugjl_index
JOIN 
    professor p ON m.bagsh_dutaar = p.professor_code;

SELECT 
    s.oyutan_code,
    s.Ner AS student_name,
    h.hicheel_ner AS course_name
FROM 
    student s
JOIN 
    student_hicheel sh ON s.oyutan_code = sh.student_code
JOIN 
    hicheel h ON sh.hicheel_code = h.hicheel_code
WHERE 
    h.hicheel_ner = 'Биологи';

SELECT 
    s.oyutan_code,
    s.Ner AS student_name,
    h.hicheel_ner AS course_name,
    b.bagsh_ner AS department_name
FROM 
    student s
JOIN 
    student_hicheel sh ON s.oyutan_code = sh.student_code
JOIN 
    hicheel h ON sh.hicheel_code = h.hicheel_code
JOIN 
    marzugjl m ON h.hicheel_code = m.marzugjl_index
JOIN 
    professor p ON m.bagsh_dutaar = p.professor_code
JOIN 
    bagsh b ON p.professor_code = b.bagsh_code;
