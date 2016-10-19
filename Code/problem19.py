#!/usr/bin/env python2

import fasta as fs
import problem18 as ed

def edit_allignment(u,v):
	i = len(u)
	j =len(v)
	edm = ed.edit_distance(u,v)
	dash = lambda w,i : w[:i] + '-' + w[i:]
	min_score = edm[i][j]
	ua, va = u, v

	while i*j != 0:
        	if edm[i][j] == 1:
            		i -= 1
            		ua = dash(ua, j)
        	elif edm[i][j] == 2:
            		j -= 1
            		va = dash(va, i)
        	else:
            		i -= 1
            		j -= 1

    	for repeat in xrange(i):
        	ua = dash(ua, 0)
    	for repeat in xrange(j):
        	va = dash(va, 0)
        return str(min_score), va, ua



if __name__ == '__main__':
	dataset = open("/Users/krishna/Downloads/rosalind_edta.txt").read().split('>')
	dataset_parse = fs.parse_fasta(dataset)
	edm_a = edit_allignment('PRETTY', 'PRTTEIN')
	#edm_a = edit_allignment(dataset_parse[0][1], dataset_parse[1][1])
	print edm_a
	#for i in edm_a:
	#	print i
