# Хүснэлтэнд багана нэмэх
ALTER TABLE husnegt_ner
ADD Email varchar(255);

# Хүснэлтэнд өгөгдөл хийх
INSERT INTO student (RD, Urgiin_owog, Owog, Ner, huis, T_Ognoo, undes, aimag, sum, geriin_hayg, geriin_utas, email, mergjil, oyutan_code)
VALUES ('1234567890', 'Баярсайхан', 'Төмөрчулуун', 'Цогтсайхан', 1, '2000-01-01', 'Монгол', 'Улаанбаатар', 'Чингэлтэй', 'Баянгол дүүрэг', '99112233', 'tsogtsaihan@email.com', 'Математик', 'M-001');
# Хүснэлтэнд дахь өгөгдлийг засах
UPDATE student
SET Ner = 'Жаргалсайхан', aimag = 'Дорнод', sum = 'Халхгол' WHERE oyutan_code = 'OYU00002';
# Хүснэлтэнд дахь өгөгдлийг устгах
DELETE FROM student
WHERE oyutan_code = '1234567890';
# Хүснэлтэнд дахь өгөгдлийг харах
SELECT * FROM student;
