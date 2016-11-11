rm(list=ls())
setwd('/Users/krishna/MIRI/BSG/R_BSG')

load('JapaneseSTRs.rda')
head(Japanese)


# Determine # STRs and # individuals in the database.
# Dimensions
dim(Japanese)
# [1]  58 683

# Change all -9 for NA.
Japanese[Japanese == '-9'] = NA

# Determine the number of alleles of the frst STR.
sum(Japanese[,1])

# Determine the allele counts for the frst STR.
length(Japanese[,1])

# Determine the genotype counts for the frst STR.


