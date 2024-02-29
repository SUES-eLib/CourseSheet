import numpy as np
import matplotlib.pyplot as plt
from skimage.feature import plot_matches
from skimage.feature import ORB
from skimage.color import rgb2gray
from skimage import io


def detect_copy_paste(image_path):
    image = io.imread(image_path)
    image_gray = rgb2gray(image)
    sift = ORB(n_keypoints=200)
    sift.detect_and_extract(image_gray)
    keypoints = sift.keypoints
    descriptors = sift.descriptors

    distance_matrix = np.sqrt(np.sum((descriptors[:, np.newaxis, :] ^ descriptors[np.newaxis, :, :]) ** 2, axis=-1))

    threshold = 0.5
    matches = np.argwhere(distance_matrix < threshold)

    fig, ax = plt.subplots(nrows=1, ncols=1)
    plt.gray()
    plot_matches(ax, image_gray, image_gray, keypoints, keypoints, matches)
    ax.axis('off')
    ax.set_title("Copy-paste detection")
    plt.show()

    if matches.size > 0:
        print("Image has been copy-pasted")
    else:
        print("Image has not been copy-pasted")


if __name__ == '__main__':
    detect_copy_paste("Ex2_image.jpg")
