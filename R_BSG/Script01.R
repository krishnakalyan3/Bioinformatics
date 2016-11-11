######################################################
##
##  Exercise descriptive analysis of genetic markers.
##
######################################################
##
## First part: SNP Data
##



# 1) Load http://www-eio.upc.es/\~jan/data/bsg/Chromosome1 CHBPopSubset.rda
rm(list=ls())
setwd('/Users/krishna/MIRI/BSG/R_BSG')
load("Chromosome1_CHBPopSubset.rda")


# 2) Install the genetics package
#install.packages("genetics")
library(genetics)
head(Ysub)

# 3) Determine $\#$ SNPs and $\#$ individuals in the database
dim(Ysub)
class(Ysub)
Ysub[1:5,1:5]
n <- nrow(Ysub)
p <- ncol(Ysub)
n
p


# 4) Change all NN for NA
Ysub[Ysub=="NN"] <- NA



# 5) Describe the first 3 SNPs with the summary command
SNP1 <- Ysub[,1]
SNP1.g <- genotype(SNP1,sep="")
summary(SNP1.g)

SNP2 <- Ysub[,2]
SNP2.g <- genotype(SNP2,sep="")
summary(SNP2.g)

SNP3 <- Ysub[,3]
SNP3.g <- genotype(SNP3,sep="")
summary(SNP3.g)



# 6) Compute the % of missings per individual and plot these
nmis <- function(x) {
  y <- sum(is.na(x))
  return(y)
}


perc.mis <- 100*sum(is.na(Ysub))/(n*p) # % of missing data
perc.mis


nmis.per.ind <- apply(Ysub,1,nmis)
pmis.per.ind <- 100*nmis.per.ind/p

plot(1:n,pmis.per.ind,xlab="Individual",ylab="Perc. Missing",ylim = c(0,50))



# 7) Compute the % of missings per SNP and plot these


nmis.per.snp <- apply(Ysub,2,nmis)
pmis.per.snp <- 100*nmis.per.snp/n

plot(1:p,pmis.per.snp,xlab="SNP",ylab="Perc. Missing")



# 8) Are there any individuals/SNPs with an exceptional amount of missing data?

sum(nmis.per.snp==n) # 199 SNPs completely missing



# 9) Compute the allele frequencies of SNP3 from the genotype frequencies

x <- table(SNP3)
x
sum(x)
sum(x,na.rm=TRUE)
n


pC <- (2*x[1]+x[2])/(2*sum(x,na.rm=TRUE))
pT <- (2*x[3]+x[2])/(2*sum(x,na.rm=TRUE))
pC
pT
pC+pT
summary(SNP3.g)



# 10) Compute the MAF for all SNPs in the database, and make a histogram. What do you observe?


Y2 <- Ysub[,nmis.per.snp < n] # filter out 199 SNPs

summary(SNP1.g)$allele.freq
summary(SNP3.g)$allele.freq

affirst <- function(x){
  x <- genotype(x,sep="")
  out <- summary(x)
  af1 <- out$allele.freq[1,2] # select the major allele
  return(af1)
}

affirst(Ysub[,1])

af.first.allele <- apply(Y2,2,affirst)
hist(af.first.allele)

maf <- function(x){
  x <- genotype(x,sep="")
  out <- summary(x)
  af1 <- min(out$allele.freq[,2],na.rm=TRUE) # select the minor
  af1[af1==1] <- 0 # if there are only one allele
  return(af1)
}

maf.per.snp <- apply(Y2,2,maf)
hist(maf.per.snp)




######################################################
##
## Second part: STR Data
##



# 1) Load http://www-eio.upc.es/~jan/data/bsg/JapaneseSTRs.rda

rm(list=ls())  # remove workspace

load("JapaneseSTRs.rda")


ls()




# 2) Determine # STRs and # individuals in the database.
dim(Japanese)
Japanese[1:5,1:10]
X <- Japanese[,6:ncol(Japanese)]
n <- nrow(X)/2
p <- ncol(X)
n
p


# 3) Change all -9 for NA.

sum(X==-9)
X[X==-9] <- NA
sum(is.na(X))



# 4) Determine the number of alleles of the first STR.


class(X)
STR1 <- X[,1]
table(STR1,useNA="always")

length(unique(STR1))

n.alleles <- function(x) {
  y <- length(unique(x[!is.na(x)]))
  return(y)
}

n.alleles(STR1) # number of alleles


# 5) Determine the allele counts for the first STR.

table(STR1) # allele counts


# 6) Determine the genotype counts for the first STR.


STR1 <- STR1[!is.na(STR1)] 
na <- length(STR1)
na

index.1 <- seq(1,na,2)
index.2 <- seq(2,na,2)

allele.1 <- STR1[index.1]
allele.2 <- STR1[index.2]

allele.1 <- pmin(allele.1,allele.2)
allele.2 <- pmax(allele.1,allele.2)

allele.1
allele.2

individuals <- paste(allele.1,allele.2,sep="/")
g.counts <- table(individuals) # genotype counts
g.counts


# 7) How many diferent genotypes are observed?

unique(names(g.counts))
names(g.counts)

sum(g.counts)
length(g.counts) # number of genotypes



# 8) How many diferent genotypes are theoretically possible?


K <- n.alleles(STR1) # number of alleles
K

n.genotypes <- 0.5*K*(K+1)
n.genotypes



# 9) Determine the number of alleles for each STR, and make a barplot of the number of alleles.
n.alleles.per.STR <- apply(X,2,n.alleles)
barplot(table(n.alleles.per.STR))


# Using genetics package for allele/genotype frequencies
summary(genotype(individuals))



