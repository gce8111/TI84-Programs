import sys
import csv

filename = sys.argv[1]

map_lst = []
with open(filename, 'r') as input:
    reader = csv.reader(input)
    for row in reader:
        for i in range(16):#each block should be 16 by 16 pixels
            map_lst += row #this innermost loop should ensure that each block is 16 pixels tall

num_bytes = 0    
map_hex = ""               #now make sure each block is 16 pixels wide: 4 hex digits = 16 bits
for block in map_lst:
    if block == '1':
        map_hex += ' .dw $FFFF\n'
    elif block == '0':
        map_hex += ' .dw $0000\n'
    num_bytes += 2
        
map_hex = "Map:\n" + map_hex

with open('.\includes\Map.asm', 'w') as output:
    output.write(map_hex)

print('successfully wrote ' + str(num_bytes) + 'bytes (' + str(num_bytes*8) + ' bits) to output')