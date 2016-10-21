#!/usr/bin/env python2
# Distances in Trees
import newick as nk

def newick_parse(tree, start, end):
	newick_tree = nk.loads(tree)
	#print newick_tree[0].length()
	print [n.name for n in newick_tree[0].descendants]
	#print start
	#print end
	return ''

def parse_data(data):
	results = []
	for d in data:
		data_split = d.split('\n')
		s,e = data_split[1].split(' ')
		result = newick_parse(data_split[0],s, e)
		results.append(result)
	return results

if __name__ == '__main__':
	dataset = open("/Users/krishna/MIRI/BSG/data/25_1").read()
	#dataset = open("/Users/krishna/MIRI/BSG/data/25").read()
	data_tree = dataset.split('\n\n')
	print parse_data(data_tree)

	#print len(trees[0].descendants)