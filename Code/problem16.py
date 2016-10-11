#!/usr/bin/env python2
# Finding a Protein Motif
import urllib
import re



if __name__ == '__main__':
	dataset = open("/Users/krishna/MIRI/BSG/data/problem15.txt").read().split('\n')
	#dataset = open("/Users/krishna/Downloads/rosalind_mprt.txt").read().split('\n')
	print dataset