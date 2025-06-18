# Өгөгдлийн сан үүсгэх
CREATE DATABASE Database_ner;
# Өгөгдлийн сан харах
SHOW DATABASES;
# Өгөгдлийн сан сонгох
USE Database_ner;
# Өгөгдлийн сан дотор байх хүснэгтүүдийг харах
SHOW TABLES;
# Хүснэлтийг мэдээлэл харах
DESCRIBE student;
# Өгөгдлийн сан устгах
DROP DATABASE database_ner;
# Хүснэгт устгах
DROP TABLE student;
# Хүснэгт үүсгэх
CREATE TABLE student
(
    RD          varchar(10)  null,
    Urgiin_owog varchar(255) null,
    Owog        varchar(255) null,
    Ner         varchar(255) null,
    huis        tinyint(1)   null,
    T_Ognoo     date         null,
    undes       varchar(255) null,
    aimag       varchar(50)  null,
    sum         varchar(50)  null,
    geriin_hayg varchar(255) null,
    geriin_utas varchar(8)   null,
    email       varchar(255) null,
    mergjil     varchar(255) null,
    oyutan_code varchar(12)  not null
    primary key
);


