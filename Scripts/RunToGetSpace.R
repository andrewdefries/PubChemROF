##objective:
#load sdf one by one
#compute mw
#group by mw
#cluster by mw
#plot chemical space of each mw class

##################
library(ChemmineR)
##################
Job2Do <- list.files(pattern=".sdf", recursive=F)
############
mwBins <-c(0, 100, 200, 300, 400, 500, 600)
####################################################
####################################################
loadNsplit <-function(a){
#load sdfset
##sdfset<-read.SDFset(Job2Do[a])
#filter by mw
########
WeighMe<-function(b){
########
Test<-MW(sdfset,addH=FALSE)<mwBins[b]  
sdfsetMW<-sdfset[Test]  
########
#

#

########
save(sdfsetMW, file=paste(Job2Do[a],mwBins[b], "_sdfset.rda", sep=""), compress=T)
########
}
########
b<-2:length(mwBins)
########
lapply(b,WeighMe)
########
}
###################################################
###################################################
a<-1:(length(Job2Do)) ##/4)
lapply(a, loadNsplit)
###################################################

#rm(ls=
Work <- list.files(pattern=".rda", recursive=F)
#Re-load and create desired data objects
############################
DoTheRealWork <-function(c){
############################
load(Work[c])
###########get apset
apset<-sdf2ap(sdfsetMW)

###########cluster
clusters<-cmp.cluster(apset, cutoff=c(0.7))
#consider different cutoff=c(0.5,0.7,0.95)
#########
save(clusters, file=paste("Clusters_", Work[a], sep="")  
###########2d vis
coord<-cluster.visualize(apset,clusters,size.cutoff=1, dimensions=2, quiet=TRUE)
#########
save(coord, file=paste("2D_Coord_", Work[a], sep="")  
###########3d vis
coord<-cluster.visualize(apset,clusters,size.cutoff=1, dimensions=3, quiet=TRUE)
#########
save(coord, file=paste("3D_Coord_", Work[a], sep="")  
###########

###########2d to hexbin
############################
}
c<-1:length(Work)
############################
