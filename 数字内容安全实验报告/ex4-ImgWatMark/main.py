from PIL import Image


def add_watermark(image_file, watermark_file):
    image = Image.open(image_file)
    watermark = Image.open(watermark_file).convert("1")
    width, height = image.size
    watermark = watermark.resize((width, height))
    watermark.save("gray.png")
    for x in range(width):
        for y in range(height):
            pixel = list(image.getpixel((x, y)))
            if watermark.getpixel((x, y)):
                pixel[-1] |= 1
            else:
                pixel[-1] &= ~1
            image.putpixel((x, y), tuple(pixel))
    image.save("watermarked.png")


def test_lsb_watermarking():
    image_file = "3430.JPG"
    watermark_file = "watermark.png"
    add_watermark(image_file, watermark_file)


if __name__ == "__main__":
    test_lsb_watermarking()