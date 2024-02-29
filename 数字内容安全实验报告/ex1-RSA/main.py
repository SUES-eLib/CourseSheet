import random
import math


# 生成一个素数
def generate_prime_number():
    while True:
        prime = random.randint(2 ** 10, 2 ** 11)
        if is_prime(prime):
            return prime


# 判断一个数是否为素数
def is_prime(n):
    if n < 2:
        return False
    for i in range(2, int(math.sqrt(n)) + 1):
        if n % i == 0:
            return False
    return True


# 计算欧拉函数的值
def euler_func(p, q):
    return (p - 1) * (q - 1)


# 计算最大公因数
def gcd(a, b):
    while b:
        a, b = b, a % b
    return a


# 计算模反元素
def mod_inverse(e, phi):
    d = 0
    x1 = 0
    x2 = 1
    y1 = 1
    temp_phi = phi

    while e > 0:
        temp1 = temp_phi // e
        temp2 = temp_phi - temp1 * e
        temp_phi = e
        e = temp2

        x = x2 - temp1 * x1
        y = d - temp1 * y1

        x2 = x1
        x1 = x
        d = y1
        y1 = y

    if temp_phi == 1:
        return d + phi


# 生成密钥
def generate_keypair():
    p = generate_prime_number()
    q = generate_prime_number()
    n = p * q
    phi = euler_func(p, q)
    e = random.randint(1, phi - 1)
    while gcd(e, phi) != 1:
        e = random.randint(1, phi - 1)
    d = mod_inverse(e, phi)
    return ((p, q), (e, n), (d, n))


# 加密
def encrypt(public_key, message):
    e, n = public_key
    cipher_text = [pow(ord(char), e, n) for char in message]
    return cipher_text


# 解密
def decrypt(private_key, cipher_text):
    d, n = private_key
    plain_text = [chr(pow(char, d, n)) for char in cipher_text]
    return ''.join(plain_text)


message = input("输入原文：")
prime, public_key, private_key = generate_keypair()
cipher_text = encrypt(public_key, message)
print('素数对：', prime)
print('公钥:', public_key)
print('私钥:', private_key)
print('密文:', cipher_text)
plain_text = decrypt(private_key, cipher_text)
print('解密后的明文:', plain_text)
