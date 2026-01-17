# คำสั่งสำหรับดึงภาพจากกล้อง USB ต่างหาก ส่งไปยัง MediaMTX ใน Docker ช่อง cam2

# 1. รันคำสั่งนี้ก่อนเพื่อหาชื่อกล้อง USB จริงๆ:
# ffmpeg -list_devices true -f dshow -i dummy

# 2. แก้ชื่อในฟันหนูใต้ video="ชื่อกล้อง" ให้ตรงกับที่เจอ
ffmpeg `
    -f dshow `
    -rtbufsize 500M `
    -i video="USB Camera" `
    -pix_fmt yuv420p `
    -c:v libx264 `
    -preset ultrafast `
    -tune zerolatency `
    -b:v 2M `
    -maxrate 2M `
    -bufsize 1M `
    -f rtsp `
    -rtsp_transport tcp `
    rtsp://localhost:8554/cam2
