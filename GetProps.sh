
for i in  *.sdf

do


echo "##############################"
echo "##############################"
echo "##############################"
echo "##############################"
echo "##############################"
echo "##############################"
echo "##############################"
echo "Taking $i in for a TPSA gander"

sudo babel $i -otxt --append TPSA > Props/$i.TPSA

echo "##############################"
echo "##############################"
echo "##############################"
echo "##############################"
echo "Taking $i for a logP walk"
echo "##############################"
echo "##############################"
echo "##############################"
echo "##############################"
echo "##############################"

sudo babel $i -otxt --append logP > Props/$i.logP

done

echo "##############################"
echo "##############################"
echo "##############################"
echo "##############################"

echo "All done"
