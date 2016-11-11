install.packages('HardyWeinberg')
library(HardyWeinberg)
x = c(CC=23,CG=48,GG=29)
ct = c(CC=0,CT=7,TT=93)
HWChisq(x)
# p value is greater than 0.5 hence it is significant
# 0.825574

HWExact(x,pvaluetype="selome",verbose=TRUE)
# p =  0.6926337 
# Since p value is 0.6926337  i.e 
# greater than 0.5 hence it is significant

ct = c(CC=0,CT=7,TT=93)

HWChisq(ct)
# p-value =  0.2784841
HWExact(ct,pvaluetype="selome",verbose=TRUE)
# p =  1
par(mfrow =c(1,2))
HWTernaryPlot(x)
HWTernaryPlot(ct)

# Write an R function for carrying out a permutation test for HWE.
x =  c(CC=0, CT=7, TT=93)
HWPerm(x, verbose=TRUE)

