import os

def assemble_bin():
    os.system('tools\\NASM\\nasm.exe -f bin code\\main.asm -o tmp\\boot.img')

def build_iso():
    os.system('tools\\oscdimg -btmp\\boot.img -o -lminios tmp bootimage.iso')

if __name__ == '__main__':
    assemble_bin()
    build_iso()
