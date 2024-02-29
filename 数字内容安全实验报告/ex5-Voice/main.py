import wave
import matplotlib.pyplot as plt
import numpy as np


def audio_to_binary(audio_file):
    with open(audio_file, "r") as f:
        binary_data = f.read()
    return binary_data


def lsb_encrypt(audio_file, watertext):
    binary_message = audio_to_binary(audio_file)
    binary_key = bin(watertext)[2:]
    padding_size = len(binary_key) - len(binary_message) % len(binary_key)
    binary_message += "0" * padding_size
    message_blocks = [binary_message[i:i + len(binary_key)] for i in range(0, len(binary_message), len(binary_key))]
    encrypted_blocks = []
    for block in message_blocks:
        block_int = int(block, 2)
        key_int = int(binary_key, 2)
        encrypted_int = block_int ^ key_int
        encrypted_block = format(encrypted_int, '0{}b'.format(len(block)))[2:]
        encrypted_blocks.append(encrypted_block)
    encrypted_binary_message = "".join(encrypted_blocks)
    encrypted_message = ""
    for i in range(0, len(encrypted_binary_message), 8):
        byte = encrypted_binary_message[i:i + 8]
        char = chr(int(byte, 2))
        encrypted_message += char
    return encrypted_message


def binary_to_wav(audio_file, watertext, output_file):
    with wave.open(audio_file, 'rb') as wav_in:
        num_channels = wav_in.getnchannels()
        sample_width = wav_in.getsampwidth()
        frame_rate = wav_in.getframerate()
    binary_data = lsb_encrypt(audio_file, watertext)
    with wave.open(output_file, 'wb') as wav_out:
        wav_out.setnchannels(num_channels)
        wav_out.setsampwidth(sample_width)
        wav_out.setframerate(frame_rate)
        wav_out.writeframes(bytes(int(binary_data[i:i + 8], 2) for i in range(0, len(binary_data), 8)))


def draw_wav(file1, file2):
    with wave.open(file1, 'rb') as wav1:
        frames1 = wav1.readframes(-1)
    with wave.open(file2, 'rb') as wav2:
        frames2 = wav2.readframes(-1)
    samples1 = np.frombuffer(frames1, dtype='int16')
    samples2 = np.frombuffer(frames2, dtype='int16')
    plt.figure(figsize=(15, 5))
    plt.subplot(2, 1, 1)
    plt.plot(samples1, 'b')
    plt.title('Waveform of File1')
    plt.xlabel('Samples')
    plt.ylabel('Amplitude')
    plt.subplot(2, 1, 2)
    plt.plot(samples2, 'r')
    plt.title('Waveform of File2')
    plt.xlabel('Samples')
    plt.ylabel('Amplitude')
    plt.tight_layout()
    plt.show()


if __name__ == '__main__':
    watertext = "028121308"
    binary_to_wav("test.wav", watertext, "watermarked_audio.wav")
    draw_wav("test.wav", "watermarked_audio.wav")
