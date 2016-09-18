from os.path import dirname
import re

DNA_CODON_TABLE = {
    'TTT': 'F',     'CTT': 'L',     'ATT': 'I',     'GTT': 'V',
    'TTC': 'F',     'CTC': 'L',     'ATC': 'I',     'GTC': 'V',
    'TTA': 'L',     'CTA': 'L',     'ATA': 'I',     'GTA': 'V',
    'TTG': 'L',     'CTG': 'L',     'ATG': 'M',     'GTG': 'V',
    'TCT': 'S',     'CCT': 'P',     'ACT': 'T',     'GCT': 'A',
    'TCC': 'S',     'CCC': 'P',     'ACC': 'T',     'GCC': 'A',
    'TCA': 'S',     'CCA': 'P',     'ACA': 'T',     'GCA': 'A',
    'TCG': 'S',     'CCG': 'P',     'ACG': 'T',     'GCG': 'A',
    'TAT': 'Y',     'CAT': 'H',     'AAT': 'N',     'GAT': 'D',
    'TAC': 'Y',     'CAC': 'H',     'AAC': 'N',     'GAC': 'D',
    'TAA': '',  	'CAA': 'Q',     'AAA': 'K',     'GAA': 'E',
    'TAG': '',  	'CAG': 'Q',     'AAG': 'K',     'GAG': 'E',
    'TGT': 'C',     'CGT': 'R',     'AGT': 'S',     'GGT': 'G',
    'TGC': 'C',     'CGC': 'R',     'AGC': 'S',     'GGC': 'G',
    'TGA': '',  	'CGA': 'R',     'AGA': 'R',     'GGA': 'G',
    'TGG': 'W',     'CGG': 'R',     'AGG': 'R',     'GGG': 'G'
}




def orf(dnadata):
	regexp = r'ATG(?:(?!TAA|TAG|TGA)...){9,}?(?:TAA|TAG|TGA)'
	dnawindow = re.findall(regexp, dnadata)
	for dna in dnawindow:
		splitdna = re.findall('...',dna)

	print splitdna
	return splitdna

def reverse_comp(dnadata):
	comlpement = {'A':'T', 'G':'C', 'T':'A', 'C':'G'}
	rev = dnadata[::-1]
	revcomp = ''.join(map(lambda x : comlpement[x], rev))
	return revcomp
    
def protein_mapping(data):
	protein = ""
	for dna in data:
		protein += DNA_CODON_TABLE[dna]
	return protein


if __name__ == '__main__':
	small_data = "AGCCATGTAGCTAACTCAGGTTACATGGGGATGACCCCGCGACTTGGATTAGAGTCTCTTTTGGAATAAGCCTGAATGATCCGAGTAGCATCTCAG"
	
	# Read data and parse data
	#dataset = open(dirname(__file__) + "/data/d1.txt").read()
	codon_seq = protein_mapping(orf(small_data[1:]))
	#codon_seq_rna = dna_rna(codon_seq)
	#codon_seq_rev = orf(reverse_comp(small_data))
	print codon_seq
	#print small_data[2:]
	