from os.path import dirname

def rev_comp(small_data):
	comp = {'A' : 'T',
			'G' : 'C',
			'T' : 'A',
			'C' : 'G'}

	dnacomp = ''
	for dna in small_data:
		dnacomp = dnacomp + comp[dna]
	return dnacomp[::-1]


if __name__ == '__main__':
    small_data = "AAAACCCGGT"
    assert (rev_comp(small_data) == 'ACCGGGTTTT')

    dataset = open(dirname(__file__) + "/data/rosalind_revc.txt").read()
    print rev_comp(dataset)