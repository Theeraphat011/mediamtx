# คำสั่งสำหรับดึงภาพจากกล้องหน้า Notebook (Ultra-low Latency)
ffmpeg `
  -f dshow `
  -rtbufsize 500M `
  -i video="HD Webcam" `
  -pix_fmt yuv420p `
  -c:v libx264 `
  -preset ultrafast `
  -tune zerolatency `
  -bf 0 `
  -g 30 `
  -thread_type slice `
  -b:v 2M `
  -maxrate 2M `
  -bufsize 1M `
  -f rtsp `
  -rtsp_transport tcp `
  rtsp://localhost:8554/cam1
