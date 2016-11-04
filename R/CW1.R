#install.packages('genetics')
library(genetics)
setwd('/Users/krishna/MIRI/BSG/R')
load('Chromosome1_CHBPopSubset.rda')
summary(Ysub)
head(Ysub)
names(Ysub)
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

na_snip_df  = (is.na(Ysub[,1:1000]))
snip_na  =colSums(na_snip_df)
plot(snip_na)
abline(35,0)

na_obs_df = (is.na(t(Ysub)))
na_obs  =colSums(na_obs_df)
plot(na_obs)
abline(400,0)

# Are there any individuals/SNPs with an exceptional amount of missing data?
paste('SNIP NAs:',sum(snip_na > 35))
paste('OBS NAs:',sum(na_obs > 400))

# Compute the allele frequencies of SNP3 from the genotype frequencies.
al_num =table(unlist(strsplit(Ysub[,3],'')))
al_tot = sum(al_num)
al_num/al_tot
maf = min(al_num/al_tot)
maf

# Compute the MAF for all SNPs in the database, and make a histogram.




