def embedded_watermark(text: str, mark_num: int):
    mark_num_bin = bin(mark_num)[2:].zfill(len(text))
    mark_num_bin = list(mark_num_bin)
    for i in range(len(text)):
        if mark_num_bin[i] == '1':
            print('\033[31m' + text[i] + '\033[0m', end='')
        else:
            print(text[i], end='')
    print()


if __name__ == "__main__":
    text = input("Input the text:")
    mark_num = int(input("Input the mark number: "))
    embedded_watermark(text, mark_num)
