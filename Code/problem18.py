#!/usr/bin/env python2
# Counting Point Mutations
import Levenshtein as l

def edit_distance(x,y):
	return (l.editops(x, y))


if __name__ == '__main__':
	dataset = open("/Users/krishna/Downloads/rosalind_edit.txt").read().split('\n')
	print edit_distance(dataset[1], dataset[3])