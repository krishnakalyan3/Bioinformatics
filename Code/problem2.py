import re
from protein import *

with open('/Users/krishna/MIRI/BSG/data/d1.txt', 'r') as myfile:
    data = myfile.read().replace('\n', '')

def codeprotein(sequence):
	splitstr = re.findall('...',sequence)
	mRNA = ''
	for i in splitstr:
		mRNA = mRNA + proteindata[i]
	return mRNA

with open('/Users/krishna/MIRI/BSG/soln/p2.txt', 'a') as myfile:
    output = codeprotein(data)
    print output 
    myfile.write(output)