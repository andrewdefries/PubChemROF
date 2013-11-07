
library(ChemmineR)
sdfset<-read.SDFset("PubChemROF.sdf")

valid <- validSDF(sdfset)
sdfset <- sdfset[valid]

apset<-sdf2ap(sdfset)

sdfset<-sdfset[!sapply(as(apset, "list"), length)==1]

write.SDF(sdfset, file="PubChemROF_FixD.sdf", sig=T)

#if doesn't work try babel conversion and removal of weird char




