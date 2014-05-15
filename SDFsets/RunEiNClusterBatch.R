library(eiR)
files <- list.files(recursive=FALSE, pattern=".sdf.ROF.sdf")
sdfset<-read.SDFset(files[1])
valid <- validSDF(sdfset); sdfset <- sdfset[valid]
apset<-sdf2ap(sdfset)
sdfset<-sdfset[-which(sapply(as(apset, "list"), length)==1)]

##################
Ei<-function(f){
eiInit(files[f])
##################
r<-50
d<-40
##################
refIddb<-eiMakeDb(r,d)
##
cluster_index <- eiCluster(r,d,5,minNbrs=2,cutoff=0.5,dir=getwd())
##
save(cluster_index, file=gsub(".sdf", "_ClusterIndex.rda", files[f]), compress=T)
}
##################
f<-1:length(files)
lapply(f, Ei)

