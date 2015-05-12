#!/bin/bash

if [ ! -z "$1" ] && [ -e $1 ]
then

  source $1

else

  echo Please provide a configuration file.
  exit

fi

###################### No modifications below this line are necessary ###########################

TOTAL=`cat $FILENAME | wc -l`

# Creating run script for condor configuration file
echo '#!/bin/csh

# This file sets up the cshell for lxplus batch queue
# If you have additional custom enhancements to your shell 
# environment, you may need to add them here

setenv CUR_DIR $PWD

setenv SCRAM_ARCH "slc6_amd64_gcc481"
setenv VO_CMS_SW_DIR "/cms/base/cmssoft"
setenv COIN_FULL_INDIRECT_RENDERING 1

# Change to your CMSSW software version
setenv MYREL "CMSSW_7_0_6_patch1"
setenv MYPROJECT "private"
setenv MYBASE "${MYPROJECT}/${MYREL}"

# Shown for c shell
# Also change 'username' to your username
cd ~ecampana/${MYBASE}/src
eval `scramv1 runtime -csh`
date

# Switch to your working directory below
cd  $CUR_DIR

# Below run your actual commands... typically a cmsRun call' > scripts/run_${TAG}.csh

chmod a+x scripts/run_${TAG}.csh

# Appending lines to run script for condor configuration file
echo 'setenv MAINDIR "${11}"' >> scripts/run_${TAG}.csh
echo 'setenv MODELNAME "${1}_${2}${3}_${4}${5}_${6}_${7}"' >> scripts/run_${TAG}.csh
echo -e 'setenv MADGRAPHDIR' '"'${MADGRAPHDIR}'"\n' >> scripts/run_${TAG}.csh
echo -e 'cd ${MAINDIR}\n' >> scripts/run_${TAG}.csh
echo -e 'mkdir -p ${MADGRAPHDIR}/proc_cards\n' >> scripts/run_${TAG}.csh
echo 'cp -r -a ${MADGRAPHDIR}/models/mssm_v4 ${MADGRAPHDIR}/models/${MODELNAME}' >> scripts/run_${TAG}.csh
echo 'cp -a store_${7}/slha/${1}_${2}${3}_${4}${5}.slha ${MADGRAPHDIR}/models/${MODELNAME}/param_card.dat' >> scripts/run_${TAG}.csh
echo -e 'cat test/${1}_proc_card_template.dat | sed "s/MODEL/${MODELNAME}/g" > ${MADGRAPHDIR}/proc_cards/${MODELNAME}_proc_card.dat\n' >> scripts/run_${TAG}.csh
echo -e 'cd ${MADGRAPHDIR}\n' >> scripts/run_${TAG}.csh
echo './bin/mg5_aMC proc_cards/${MODELNAME}_proc_card.dat >& ${MODELNAME}.log' >> scripts/run_${TAG}.csh
echo -e 'mv ${MODELNAME}.log  ${MODELNAME}/.\n' >> scripts/run_${TAG}.csh
echo 'setenv EVENT "${9}"' >> scripts/run_${TAG}.csh
echo 'setenv SEED `cat ${MAINDIR}/test/randomSeedPi.txt | awk -v nline=${6} '"'"'{if (NR == nline) print $1}'"'"'`' >> scripts/run_${TAG}.csh
echo 'setenv XQCUT "${10}"' >> scripts/run_${TAG}.csh
echo -e 'cat ${MAINDIR}/test/${1}_run_card_template.dat | sed "s/NEVENT/${EVENT}/g" | sed "s/NUMBER/${SEED}/g" | sed "s/NXQCUT/${XQCUT}/g" > ${MODELNAME}/Cards/run_card.dat\n' >> scripts/run_${TAG}.csh
echo -e 'cd ${MODELNAME}\n' >> scripts/run_${TAG}.csh
echo './bin/generate_events -f ${MODELNAME} >& ${MODELNAME}_temp.log' >> scripts/run_${TAG}.csh
echo 'cat ${MODELNAME}_temp.log >> ${MODELNAME}.log' >> scripts/run_${TAG}.csh
echo -e 'rm ${MODELNAME}_temp.log\n' >> scripts/run_${TAG}.csh
echo -e 'gunzip Events/${MODELNAME}/unweighted_events.lhe.gz\n' >> scripts/run_${TAG}.csh


# Switch to your working directory below
echo -e 'cd ../BRIDGE\n' >> scripts/run_${TAG}.csh
echo -e './runBRIsusy.exe ../models/${MODELNAME}/particles.dat ../models/${MODELNAME}/param_card.dat ../models/${MODELNAME}/interactions.dat ../models/${MODELNAME}/ ../models/${MODELNAME}/${MODELNAME} blist x1+ x1- n2 elist ${SEED} 50000 5 N\n' >> scripts/run_${TAG}.csh
echo 'if ( ${7} == "HW" ) then' >> scripts/run_${TAG}.csh
echo 'cat ../models/${MODELNAME}/n2_decays.table | awk '\''{if (NF == 3 && $1 == "n1" && $2 == "z") {printf "%s %s %0.6f\n", $1,$2, 0.000000} else if (NF == 3 && $1 == "n1" && $2 == "h1" ) {printf "%s %s %0.6f\n", $1,$2, 1.000000} else if (NF == 3 && $1 != "#") {printf "%s %s %0.6f\n", $1,$2, 0.000000} else if (NF == 4 && $1 != "#") {printf "%s %s %s %0.6f\n", $1,$2, $3, 0.000000} else if ($1 == "#") {print}}'\'' > ../models/${MODELNAME}/n2_decays.table_temp' >> scripts/run_${TAG}.csh
echo -e 'endif\n' >> scripts/run_${TAG}.csh
echo -e 'mv ../models/${MODELNAME}/n2_decays.table_temp ../models/${MODELNAME}/n2_decays.table\n' >> scripts/run_${TAG}.csh
echo './runDGEsusy.exe ../models/${MODELNAME}/particles.dat ../models/${MODELNAME}/param_card.dat ../models/${MODELNAME}/interactions.dat ../${MODELNAME}/Events/${MODELNAME}/unweighted_events.lhe ../${MODELNAME}/Events/${MODELNAME}/${MODELNAME}.lhe ../models/${MODELNAME}/ ${SEED} 3 ../../test/full_decays.txt' >> scripts/run_${TAG}.csh
echo -e 'cd ${MAINDIR}\n' >> scripts/run_${TAG}.csh
echo -e './ExplicitHiggsDecayer.sh ${8} ${MODELNAME} ${MADGRAPHDIR} ${MAINDIR}\n' >> scripts/run_${TAG}.csh
echo 'cd ${MADGRAPHDIR}/${MODELNAME}/Events/${MODELNAME}' >> scripts/run_${TAG}.csh
echo '${MAINDIR}/test/lheDataOps.py unweighted_events.lhe ${MODELNAME}_${8}.lhe' >> scripts/run_${TAG}.csh
echo -e 'cp ${MODELNAME}_${8}_official.lhe ${MAINDIR}/store_${7}/lhe/.\n' >> scripts/run_${TAG}.csh
echo 'cd ${MAINDIR}' >> scripts/run_${TAG}.csh

if [ $DEBUG = false ]
then
echo 'rm -rf ${MADGRAPHDIR}/${MODELNAME}' >> scripts/run_${TAG}.csh
echo 'rm -rf ${MADGRAPHDIR}/models/${MODELNAME}' >> scripts/run_${TAG}.csh
fi

# Job submissions
for (( i = 1; i <= $TOTAL; i = i+1 ))
do

  j=`cat $FILENAME | awk -v number=$i '{if (number == NR) print $1}'` # top squark mass
  k=`cat $FILENAME | awk -v number=$i '{if (number == NR) print $2}'` # chargino mass
  l=`cat $FILENAME | awk -v number=$i '{if (number == NR) print $3}'` # random seed
  m=`cat $FILENAME | awk -v number=$i '{if (number == NR) print $4}'` # higgsino decay mode
  n=`cat $FILENAME | awk -v number=$i '{if (number == NR) print $5}'` # higgs boson decay mode
  o=`cat $FILENAME | awk -v number=$i '{if (number == NR) print $6}'` # number of events
  p=`cat $FILENAME | awk -v number=$i '{if (number == NR) print $7}'` # xqcut value

  NAME="${TAG}_${NAMEONE}${j}_${NAMETWO}${k}_${l}_${m}_${n}"
  ARGUMENT="${TAG} ${NAMEONE} ${j} ${NAMETWO} ${k} ${l} ${m} ${n} ${o} ${p} ${MAINDIR}"

  BATCHLOG="batchlogs/${NAME}.stdout"

  echo ${ARGUMENT}

  bsub -q 2nd -J ${NAME} -o ${BATCHLOG} -e ${BATCHLOG} "${MAINDIR}/scripts/run_${TAG}.csh ${ARGUMENT}"

done
