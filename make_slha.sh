#!/bin/bash

main()
{
  if [ ! -z "$1" ] && [ -e $1 ]
  then

    source $1

  else

    echo Please provide a configuration file.
    exit

  fi

  ###################### No modifications below this line are necessary ###########################

  TOTAL=`cat $SLHAFILENAME | wc -l`

  cd ${MAINDIR}

  for (( i = 1; i <= $TOTAL; i = i+1 ))
  do

    j=`cat $SLHAFILENAME | awk -v number=$i '{if (number == NR) print $1}'`
    k=`cat $SLHAFILENAME | awk -v number=$i '{if (number == NR) print $2}'`
    l=`cat $SLHAFILENAME | awk -v number=$i '{if (number == NR) print $3}'`

    echo "test/SusyHiggs_template.slha ${j} ${j} ${k} store_${l}/slha/${TAG}_${NAMEONE}${j}_${NAMETWO}${k}.slha"
    runSLHA test/SusyHiggs_template.slha ${j} ${j} ${k} store_${l}/slha/${TAG}_${NAMEONE}${j}_${NAMETWO}${k}.slha

  done
}

runSLHA()
{
  if [ $# -ne 5 ]; then
           echo Usage: $0 \<inputname\> \<mchargino1\> \<mhiggsino1\> \<mbino\> \<outputname\>
           exit 127
  fi

  cp $1 $1_temp_1

  ( cat $1_temp_1 | awk '{

         if ($2 == "mchar1") printf "%10s%19.8e%4s %s\n","1000024",'$2',$3,$4;
         else if ($2 == "mneut2") printf "%10s%19.8e%4s %s\n","1000023",'$3',$3,$4;
         else if ($2 == "mbino") printf "%10s%19.8e%4s %s\n","1000022",'$4',$3,$4;
         else print;
  }' ) > $5

  rm -f $1_temp_*
}

main ${1}
