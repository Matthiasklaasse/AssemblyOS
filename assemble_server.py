import assembler
import hashlib

hash = ''
while True:
    with open('code/main.asm', 'rb') as f:
        hasher = hashlib.md5()
        for chunk in iter(lambda: f.read(4096), b''):
            hasher.update(chunk)
    
    if(hash != hasher.hexdigest()):
        hash = hasher.hexdigest()
        
        assembler.assemble_bin()
        assembler.build_iso()