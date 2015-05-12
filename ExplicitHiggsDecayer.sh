#!/bin/bash

main()
{
  HIGGSBOSONDECAYMODE=${1}
  TAGNAME=${2}
  MADGRAPHDIR=${3}
  MAINDIR=${4}

  cd ${MAINDIR}/BRIDGESCRIPTS

  LHEPATH="../${MADGRAPHDIR}/${TAGNAME}/Events/${TAGNAME}"

  if [ ${HIGGSBOSONDECAYMODE} = "wwww" ]
  then

    echo "In wwww"
    ./DECAYRUNNER.sh ${LHEPATH}/${TAGNAME}.lhe ${LHEPATH}/${TAGNAME}_${HIGGSBOSONDECAYMODE}.lhe 25 hww.lhe ${TAGNAME}_${HIGGSBOSONDECAYMODE}

  elif [ ${HIGGSBOSONDECAYMODE} = "wwzz" ]
  then

    echo "In wwzz"
    ./MIXDECAYDGERUNNER.sh ${LHEPATH}/${TAGNAME}.lhe ${LHEPATH}/${TAGNAME}_${HIGGSBOSONDECAYMODE}.lhe 25 1 hww.lhe 1 hzz.lhe 2HDMaa ${TAGNAME}_${HIGGSBOSONDECAYMODE}

  elif [ ${HIGGSBOSONDECAYMODE} = "wwtt" ]
  then

    echo "In wwtt"
   ./MIXDECAYDGERUNNER.sh ${LHEPATH}/${TAGNAME}.lhe ${LHEPATH}/${TAGNAME}_${HIGGSBOSONDECAYMODE}.lhe 25 1 hww.lhe 0 htautau 2HDMaa ${TAGNAME}_${HIGGSBOSONDECAYMODE}

  elif [ ${HIGGSBOSONDECAYMODE} = "wwbb" ]
  then

    echo "In wwbb"
    ./MIXDECAYDGERUNNER.sh ${LHEPATH}/${TAGNAME}.lhe ${LHEPATH}/${TAGNAME}_${HIGGSBOSONDECAYMODE}.lhe 25 1 hww.lhe 0 hbb 2HDMaa ${TAGNAME}_${HIGGSBOSONDECAYMODE}

  elif [ ${HIGGSBOSONDECAYMODE} = "wwaa" ]
  then

    echo "In wwaa"
    ./MIXDECAYDGERUNNER.sh ${LHEPATH}/${TAGNAME}.lhe ${LHEPATH}/${TAGNAME}_${HIGGSBOSONDECAYMODE}.lhe 25 1 hww.lhe 0 haa 2HDMaa ${TAGNAME}_${HIGGSBOSONDECAYMODE}

  elif [ ${HIGGSBOSONDECAYMODE} = "zzzz" ]
  then

    echo "In zzzz"
    ./DECAYRUNNER.sh ${LHEPATH}/${TAGNAME}.lhe ${LHEPATH}/${TAGNAME}_${HIGGSBOSONDECAYMODE}.lhe 25 hzz.lhe ${TAGNAME}_${HIGGSBOSONDECAYMODE}

  elif [ ${HIGGSBOSONDECAYMODE} = "zztt" ]
  then

    echo "In zztt"
    ./MIXDECAYDGERUNNER.sh ${LHEPATH}/${TAGNAME}.lhe ${LHEPATH}/${TAGNAME}_${HIGGSBOSONDECAYMODE}.lhe 25 1 hzz.lhe 0 htautau 2HDMaa ${TAGNAME}_${HIGGSBOSONDECAYMODE}

  elif [ ${HIGGSBOSONDECAYMODE} = "zzbb_fully_leptonic" ]
  then

    echo "In zzbb_fully_leptonic"
    ./MIXDECAYDGERUNNER.sh ${LHEPATH}/${TAGNAME}.lhe ${LHEPATH}/${TAGNAME}_${HIGGSBOSONDECAYMODE}.lhe 25 1 hzzllll.lhe 0 hbb 2HDMaa ${TAGNAME}_${HIGGSBOSONDECAYMODE}

  elif [ ${HIGGSBOSONDECAYMODE} = "zzbb_democratic" ]
  then

    echo "In zzbb_fully_democratic"
    ./MIXDECAYDGERUNNER.sh ${LHEPATH}/${TAGNAME}.lhe ${LHEPATH}/${TAGNAME}_${HIGGSBOSONDECAYMODE}.lhe 25 1 hzz.lhe 0 hbb 2HDMaa ${TAGNAME}_${HIGGSBOSONDECAYMODE}

  elif [ ${HIGGSBOSONDECAYMODE} = "zzaa" ]
  then

  echo "In zzaa"
    ./MIXDECAYDGERUNNER.sh ${LHEPATH}/${TAGNAME}.lhe ${LHEPATH}/${TAGNAME}_${HIGGSBOSONDECAYMODE}.lhe 25 1 hzz.lhe 0 haa 2HDMaa ${TAGNAME}_${HIGGSBOSONDECAYMODE}

  elif [ ${HIGGSBOSONDECAYMODE} = "tttt" ]
  then

    echo "In tttt"
    ./DGERUNNERsing.sh ${LHEPATH}/${TAGNAME}.lhe ${LHEPATH}/${TAGNAME}_${HIGGSBOSONDECAYMODE}.lhe 25 htautau 2HDMaa ${TAGNAME}_${HIGGSBOSONDECAYMODE}

  elif [ ${HIGGSBOSONDECAYMODE} = "ttbb" ]
  then

    echo "In ttbb"
    ./MIXDECAYDGERUNNER.sh ${LHEPATH}/${TAGNAME}.lhe ${LHEPATH}/${TAGNAME}_${HIGGSBOSONDECAYMODE}.lhe 25 0 htautau 0 hbb 2HDMaa ${TAGNAME}_${HIGGSBOSONDECAYMODE}

  elif [ ${HIGGSBOSONDECAYMODE} = "ttaa" ]
  then

    echo "In ttaa"
    ./MIXDECAYDGERUNNER.sh ${LHEPATH}/${TAGNAME}.lhe ${LHEPATH}/${TAGNAME}_${HIGGSBOSONDECAYMODE}.lhe 25 0 htautau 0 haa 2HDMaa ${TAGNAME}_${HIGGSBOSONDECAYMODE}

  elif [ ${HIGGSBOSONDECAYMODE} = "bbbb" ]
  then

    echo "In bbbb"
    ./DGERUNNERsing.sh ${LHEPATH}/${TAGNAME}.lhe ${LHEPATH}/${TAGNAME}_${HIGGSBOSONDECAYMODE}.lhe 25 hbb 2HDMaa ${TAGNAME}_${HIGGSBOSONDECAYMODE}

  elif [ ${HIGGSBOSONDECAYMODE} = "bbaa" ]
  then

    echo "In bbaa"
    ./MIXDECAYDGERUNNER.sh ${LHEPATH}/${TAGNAME}.lhe ${LHEPATH}/${TAGNAME}_${HIGGSBOSONDECAYMODE}.lhe 25 0 hbb 0 haa 2HDMaa ${TAGNAME}_${HIGGSBOSONDECAYMODE}

  elif [ ${HIGGSBOSONDECAYMODE} = "wwz" ]
  then

    echo "In wwz"
    ./DECAYRUNNER.sh ${LHEPATH}/${TAGNAME}.lhe ${LHEPATH}/${TAGNAME}_${HIGGSBOSONDECAYMODE}.lhe 25 hww.lhe ${TAGNAME}_${HIGGSBOSONDECAYMODE}

  elif [ ${HIGGSBOSONDECAYMODE} = "zzz" ]
  then

    echo "In zzz"
    ./DECAYRUNNER.sh ${LHEPATH}/${TAGNAME}.lhe ${LHEPATH}/${TAGNAME}_${HIGGSBOSONDECAYMODE}.lhe 25 hzz.lhe ${TAGNAME}_${HIGGSBOSONDECAYMODE}

  elif [ ${HIGGSBOSONDECAYMODE} = "ttz" ]
  then

    echo "In ttz"
    ./DGERUNNERsing.sh ${LHEPATH}/${TAGNAME}.lhe ${LHEPATH}/${TAGNAME}_${HIGGSBOSONDECAYMODE}.lhe 25 htautau 2HDMaa ${TAGNAME}_${HIGGSBOSONDECAYMODE}

  elif [ ${HIGGSBOSONDECAYMODE} = "bbz" ]
  then

    echo "In bbz"
    ./DGERUNNERsing.sh ${LHEPATH}/${TAGNAME}.lhe ${LHEPATH}/${TAGNAME}_${HIGGSBOSONDECAYMODE}.lhe 25 hbb 2HDMaa ${TAGNAME}_${HIGGSBOSONDECAYMODE}

  elif [ ${HIGGSBOSONDECAYMODE} = "aaz" ]
  then

    echo "In aaz"
    ./DGERUNNERsing.sh ${LHEPATH}/${TAGNAME}.lhe ${LHEPATH}/${TAGNAME}_${HIGGSBOSONDECAYMODE}.lhe 25 haa 2HDMaa ${TAGNAME}_${HIGGSBOSONDECAYMODE}

  elif [ ${HIGGSBOSONDECAYMODE} = "zz" ]
  then

    echo "Higgsinos decayed to a pair of Z bosons!!!"
    cp ${LHEPATH}/${TAGNAME}.lhe ${LHEPATH}/${TAGNAME}_${HIGGSBOSONDECAYMODE}.lhe

  elif [ ${HIGGSBOSONDECAYMODE} = "www" ]
  then

    echo "In www"
    ./DECAYRUNNER.sh ${LHEPATH}/${TAGNAME}.lhe ${LHEPATH}/${TAGNAME}_${HIGGSBOSONDECAYMODE}.lhe 25 hww.lhe ${TAGNAME}_${HIGGSBOSONDECAYMODE}

  elif [ ${HIGGSBOSONDECAYMODE} = "zzw" ]
  then

    echo "In zzw"
    ./DECAYRUNNER.sh ${LHEPATH}/${TAGNAME}.lhe ${LHEPATH}/${TAGNAME}_${HIGGSBOSONDECAYMODE}.lhe 25 hzz.lhe ${TAGNAME}_${HIGGSBOSONDECAYMODE}

  elif [ ${HIGGSBOSONDECAYMODE} = "ttw" ]
  then

    echo "In ttw"
    ./DGERUNNERsing.sh ${LHEPATH}/${TAGNAME}.lhe ${LHEPATH}/${TAGNAME}_${HIGGSBOSONDECAYMODE}.lhe 25 htautau 2HDMaa ${TAGNAME}_${HIGGSBOSONDECAYMODE}

  elif [ ${HIGGSBOSONDECAYMODE} = "bbw" ]
  then

    echo "In bbw"
    ./DGERUNNERsing.sh ${LHEPATH}/${TAGNAME}.lhe ${LHEPATH}/${TAGNAME}_${HIGGSBOSONDECAYMODE}.lhe 25 hbb 2HDMaa ${TAGNAME}_${HIGGSBOSONDECAYMODE}

  elif [ ${HIGGSBOSONDECAYMODE} = "aaw" ]
  then

    echo "In aaw"
    ./DGERUNNERsing.sh ${LHEPATH}/${TAGNAME}.lhe ${LHEPATH}/${TAGNAME}_${HIGGSBOSONDECAYMODE}.lhe 25 haa 2HDMaa ${TAGNAME}_${HIGGSBOSONDECAYMODE}

  else

    echo "Run script did not run properly!!!"

  fi

  cd -
}

main ${1} ${2} ${3} ${4}
