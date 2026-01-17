# คำสั่งสำหรับดึงภาพจากกล้องหน้า Notebook ส่งไปยัง MediaMTX ใน Docker
# ปรับแต่งให้รองรับ Buffer ขนาดใหญ่และใช้ TCP เพื่อความเสถียรสูงสุด

ffmpeg `
  -f dshow `
  -rtbufsize 500M `
  -i video="HD Webcam" `
  -pix_fmt yuv420p `
  -c:v libx264 `
  -preset ultrafast `
  -tune zerolatency `
  -b:v 2M `
  -maxrate 2M `
  -bufsize 1M `
  -f rtsp `
  -rtsp_transport tcp `
  rtsp://localhost:8554/cam1
