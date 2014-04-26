for i in *.sdf

do 

babel $i -O $i.500.sdf --filter "MW<500"

done
