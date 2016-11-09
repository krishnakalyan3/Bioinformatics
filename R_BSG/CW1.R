rm(list=ls())
#install.packages('genetics')
library(genetics)
setwd('/Users/krishna/MIRI/BSG/R_BSG')
load('Chromosome1_CHBPopSubset.rda')
summary(Ysub)
head(Ysub)
# SNIP, #Individual

# Number of Individuals
nrow(Ysub)

# Number of SNIPS
ncol(Ysub)

# Change NN for NA
Ysub[Ysub == 'NN'] = NA

# First 3 snips with Summary
#Ysub[,1:5]
Geno1 = genotype(Ysub[,1], sep="")
summary(Geno1)

Geno2 = genotype(Ysub[,2], sep="")
summary(Geno2)

Geno3 = genotype(Ysub[,3], sep="")
summary(Geno3)
head(Ysub[,1:3])

# Compute the % of missings per individual and plot these.
plot(Geno3)
total = length(Geno3)
na = total - sum(table(Geno3))
per_missing = na/total
per_missing * 100
table(Geno3)/total * 100

NaIndv <- rowMeans(is.na(Ysub))*100
plot(NaIndv, main="Perc. of Missings per Individual",xlab= "Individual", ylab="Percentage")

NaSNP <- colMeans(is.na(Ysub))*100
plot(NaSNP, main="Perc. of Missings per SNP",xlab= "SNPs", ylab="Percentage")


# Compute the allele frequencies of SNP3 from the genotype frequencies.

Ysub = Ysub[,colSums(!is.na(Ysub)) > 0]
allele_freq <- function(geno){
  sum_geno=sum(table(unlist(strsplit(geno,""))))
  prob = table(unlist(strsplit(geno,"")))
  maf = min(prob/sum_geno)
  if(maf==1){
    maf = 0
  }
  return(maf)
}

allele = apply(Ysub, 2, allele_freq)
# Compute the MAF for all SNPs in the database, and make a histogram.
hist(unname(unlist(allele)), xlab="MAF Probability", ylab="")
