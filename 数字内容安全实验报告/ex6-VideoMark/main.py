import cv2
import numpy as np

def LSB_video_watermark(cover_video_path, watermark_path, output_video_path):
    cap = cv2.VideoCapture(cover_video_path)
    watermark = cv2.imread(watermark_path, cv2.IMREAD_GRAYSCALE)
    fps = int(cap.get(cv2.CAP_PROP_FPS))
    width = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
    height = int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))
    watermark_resized = cv2.resize(watermark, (int(width/4), int(height/4)))
    message = np.zeros((watermark_resized.size + 32 + 907200,), dtype=np.uint8)
    message[:32] = np.frombuffer(np.array([width, height, watermark_resized.shape[0], watermark_resized.shape[1]], dtype=np.int64).tobytes(), dtype=np.uint8)
    message[32:] = np.unpackbits(watermark_resized.flatten(), axis=0)
    fourcc = cv2.VideoWriter_fourcc(*'mp4v')
    out = cv2.VideoWriter(output_video_path, fourcc, fps, (width, height))
    while True:
        ret, frame = cap.read()
        if not ret:
            break
        encoded_frame = np.copy(frame)
        for i, bit in enumerate(np.unpackbits(message)):
            x = i % width
            y = 1000
            encoded_frame[y, x] = (encoded_frame[y, x] & ~1) | bit
        blurred = cv2.GaussianBlur(encoded_frame, (5, 5), 0)
        sharpened = cv2.addWeighted(encoded_frame, 1.5, blurred, -0.5, 0)
        out.write(sharpened)
    cap.release()
    out.release()

if __name__ == '__main__':
    LSB_video_watermark('ehan.mp4', 'watermark.png', 'output_video.mp4')
