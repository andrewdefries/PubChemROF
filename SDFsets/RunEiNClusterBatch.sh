#####
rm -r data
rm -r run-*
rm RunLog

#####
#R CMD BATCH CreatNewTable.R
#gsutil ls gs://pubchem/*.sdf | sed -n '1,235p' > WorkList
#gsutil ls gs://pubchem/*.sdf | sed -n '236,470p' > WorkList1
#gsutil ls gs://pubchem/*.sdf | sed -n '471,705p' > WorkList2
#gsutil ls gs://pubchem/*.sdf | sed -n '706,940p' > WorkList3
#gsutil ls gs://pubchem/*.sdf | sed -n '941,1175p' > WorkList4
#gsutil ls gs://pubchem/*.sdf | sed -n '1176,1410p' > WorkList5
#gsutil ls gs://pubchem/*.sdf | sed -n '1411,1645p' > WorkList6
#gsutil ls gs://pubchem/*.sdf | sed -n '1646,1880p' > WorkList7
#gsutil ls gs://pubchem/*.sdf | sed -n '1881,2115p' > WorkList8
#gsutil ls gs://pubchem/*.sdf | sed -n '2116,2350p' > WorkList9
#gsutil ls gs://pubchem/*.sdf | sed -n '2351,2585p' > WorkList10
#gsutil ls gs://pubchem/*.sdf | sed -n '2586,2816p' > WorkList11

#1  236  471  706  941 1176 1411 1646 1881 2116 2351 2586

##ls *.sdf > WorkList
####
##filecontent=(`cat "WorkList"`)
####
##for t in "${filecontent[@]}"
####
##do
####
##mkdir $t.temp
##cp $t $t.temp/
##cp *.R $t.temp/
##cd $t.temp

#gsutil -m cp $t .
###
echo "#################################"
echo "#################################"
echo "Doing some eiR"
echo "#################################"
echo "#################################"

R CMD BATCH RunEiNClusterBatch.R


       
cat *.Rout >> RunLog

#rm *.sdf
rm *.Rout
###

echo "#################################"
echo "#################################"
echo "#################################"
echo "#########done####################"
echo "#################################"
echo "#################################"

##cd ..

###
#done
####
#####
#ls *.sdf | sed 's/\.sdf/_eiR/g' > Out
#Name=(`cat Out`)
#mv data "$Name"
#gsutil -m cp "$Name" gs://swapmeet


mv data PubChemROF_data
mv run-50-40 PubChemROF_runs

gsutil -m cp -R PubChemROF_* gs://swapmeet

echo "#################################"
echo "All is done"
echo "#################################"

