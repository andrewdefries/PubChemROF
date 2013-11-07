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
sdfset<-read.SDFset(Job2Do[a])
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
#save(sdfsetMW, file=paste(Job2Do[a],mwBins[b], "_sdfset.rda", sep=""), compress=T)
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
a<-1:(length(Job2Do)/4)
lapply(a, loadNsplit)
############
