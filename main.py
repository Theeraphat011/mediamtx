import cv2

def main():
    # URL ของ RTSP stream จาก MediaMTX
    # cam1 คือ path ที่เราตั้งไว้ใน mediamtx.yml
    rtsp_url = "rtsp://localhost:8554/cam1"
    
    # เริ่มต้นเชื่อมต่อกับ RTSP Stream
    cap = cv2.VideoCapture(rtsp_url)
    
    # ตั้งค่า Buffer ให้ต่ำที่สุดเพื่อลด Delay (OpenCV Backend dependent)
    cap.set(cv2.CAP_PROP_BUFFERSIZE, 1)

    if not cap.isOpened():
        print(f"Error: ไม่สามารถเปิด Stream ได้ที่ {rtsp_url}")
        return

    print("Success: กำลังเปิดกล้องผ่าน OpenCV (กด 'q' เพื่อปิด)")

    while True:
        ret, frame = cap.read()
        
        if not ret:
            print("Error: ไม่สามารถรับภาพได้ (Stream อาจจะหลุด)")
            break

        # แสดงภาพในหน้าต่าง
        cv2.imshow('MediaMTX - OpenCV Stream', frame)

        # กด 'q' เพื่อออกจากโปรแกรม
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

    # คืนค่าทรัพยากร
    cap.release()
    cv2.destroyAllWindows()

if __name__ == "__main__":
    main()
