
from PIL import Image, ImageDraw, ImageFont
import sys
import mysql.connector

if len(sys.argv) < 2:
    print("`burgeilId` hoosom")
    sys.exit(1)

burgeil_id = sys.argv[1]

connection = mysql.connector.connect(
    host='localhost',
    port=33061,              
    user='root',            
    password='123456',  
    database='zhzb'
)

cursor = connection.cursor(dictionary=True)

cursor.execute("""
    SELECT zb.burgeilId, zb.ognoo, m.plateNo, mk.markNer, uild.uildverlegchNer, ung.unguNer,
           ez.Ner AS ownerNer, ez.Owog AS ownerOwog, cam.camerBairshil, z.tailbar, z.tulbur
    FROM zorchilburtgel zb
    JOIN mashin m ON zb.mashinDugaar = m.plateNo
    JOIN ezemshgch ez ON m.EzemshigchRD = ez.EzemshigchRD
    JOIN mark mk ON m.markcode = mk.markcode
    JOIN uildverlegch uild ON mk.uildverCode = uild.uildverlegchId
    JOIN ungu ung ON m.unguCode = ung.unguId
    JOIN camer cam ON zb.camerCode = cam.camerId
    JOIN zxtx z ON zb.duremCode = z.Id
    WHERE zb.burgeilId = %s
""", (burgeil_id,))

record = cursor.fetchone()

if not record:
    print(f"❌alga bn {burgeil_id}")
    cursor.close()
    connection.close()
    sys.exit(1)

width, height = 1000, 1200
doc_image = Image.new("RGB", (width, height), "white")
draw = ImageDraw.Draw(doc_image)
font_path = "C:/Windows/Fonts/arial.ttf" 
font = ImageFont.truetype(font_path, 20)


lines = [
    "ЗӨРЧЛИЙГ БАРИМТЖУУЛСАН ТОРГУУЛИЙН МЭДЭГДЭХ ХУУДАС",
    "",
    f"Нэр: {record['ownerOwog']} {record['ownerNer']}",
    f"Мэдэгдлийн огноо: {record['ognoo'].strftime('%Y.%m.%d')}",
    "",
    "ЗӨРЧЛИЙН БАРИМТ, МЭДЭЭЛЭЛ",
    f"Огноо: {record['ognoo'].strftime('%Y.%m.%d %H:%M:%S')}",
    f"Байршил: {record['camerBairshil']}",
    f"Тээврийн хэрэгслийн дугаар: {record['plateNo']}",
    f"Марк: {record['uildverlegchNer']} - {record['markNer']}",
    f"Өнгө: {record['unguNer']}",
    f"Зөрчил: {record['tailbar']}",
    "Зөрчлийн заалт: Замын хөдөлгөөний тухай хууль",
    "",
    "ТОРГУУЛИЙН ХУУДАС",
    f"Торгуулийн хэмжээ: {record['tulbur']}₮",
    "Төлбөрийн хугацаа: 14 хоногийн дотор",
    "",
    "Цагдаагийн байцаагч: ..........   Овог нэр: .............."
]


x, y = 50, 50
for line in lines:
    draw.text((x, y), line, font=font, fill="black")
    y += 35

filename = f"violation_doc_{burgeil_id}.jpg"
doc_image.save(filename)
print(f"Document vvssen: {filename}")


cursor.close()
connection.close()
