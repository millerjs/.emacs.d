

import fileinput

for line in fileinput.input():
    print line[::-1]


