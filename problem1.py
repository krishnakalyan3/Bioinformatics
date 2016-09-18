with open('/Users/krishna/MIRI/BSG/data/d1.txt', 'r') as myfile:
    ip = myfile.read().replace('\n', '')

def DNAtoRNA(string):
	x = ''
	for i in string:
		if i == 'T':
			x = x + 'U'
		else:
			x = x + i
	return x
    
data =  "GATGGAACTTGACTACGTAAATT"
print DNAtoRNA(data)