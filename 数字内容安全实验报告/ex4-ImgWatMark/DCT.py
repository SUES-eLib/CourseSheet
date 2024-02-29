from PIL import Image
import numpy as np


def rgb2gray(rgb):
    return np.dot(rgb[..., :3], [0.299, 0.587, 0.114])


def dct2(block):
    return np.array([[np.cos((2*i+1)*j*np.pi/16)*np.cos((2*k+1)*l*np.pi/16) for l in range(8)] for k in range(8) for j in range(8) for i in range(8)])


def idct2(block):
    return np.round(np.fft.ifftn(block, norm="ortho").real, 4)


image = Image.open("3430.JPG")
gray_image = rgb2gray(np.asarray(image))
dct_blocks = np.zeros_like(gray_image)
for i in range(0, gray_image.shape[0], 8):
    for j in range(0, gray_image.shape[1], 8):
        dct_blocks[i:i + 8, j:j + 8] = dct2(gray_image[i:i + 8, j:j + 8])
watermark = Image.open("watermark.png")
watermark = watermark.resize(image.size)
gray_watermark = rgb2gray(np.asarray(watermark))
alpha = 0.1
dct_blocks[4:12, 4:12] += alpha * gray_watermark[4:12, 4:12]
watermarked_image = np.zeros_like(gray_image)
watermark.save("dct_watermark.png")
for i in range(0, gray_image.shape[0], 8):
    for j in range(0, gray_image.shape[1], 8):
        watermarked_image[i:i + 8, j:j + 8] = idct2(dct_blocks[i:i + 8, j:j + 8])
Image.fromarray(watermarked_image.astype('uint8')).save("dct_watermarked.png")