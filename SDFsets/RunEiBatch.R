library(eiR)
files <- list.files(recursive=FALSE, pattern=".sdf.ROF.sdf")
#sdfset<-read.SDFset(files[1])
#valid <- validSDF(sdfset); sdfset <- sdfset[valid]
#apset<-sdf2ap(sdfset)
#sdfset<-sdfset[-which(sapply(as(apset, "list"), length)==1)]

##################
Ei<-function(f){
eiInit(files[f])
}
##################
f<-1:length(files)
lapply(f, Ei)

