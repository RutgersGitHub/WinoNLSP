# Instructions after checking out repository
A. Update the MAINDIR shell variable in WinoNLSP.cfg with your 
   current working path

# Special instructions
A. You will need to download MadGraph5 v2.1.1 or later,
   as well as the BRIDGE software

B. You will need to download BRIDGE v2.24 or later and 
   then properly compile it using directions found in the 
   document:
   https://github.com/RutgersGitHub/MCProductionGuide/blob/master/notes/tmp/RutgersMCGuide_temp.pdf

C. Download the Explicit Higgs Decayer from Indico webpage:
   wget https://indico.cern.ch/event/396847/contribution/0/material/0/0.gz
   tar -xzvf 0.gz

D. Update the following files in the BRIDGESCRIPTS directory:
   DECAYRUNNER.sh, DGERUNNER.sh, DGERUNNERsing.sh, and MIXDECAYDGERUNNER.sh 
   by changing the shell variable MGdir to point to your current MadGraph5 
   directory while runhiggsinohdecays.sh and runhiggsinohdecaysgamma.sh 
   should point to your current BRIDGESCRIPTS directory

E. Lastly, create a solf link in the MadGraph models directory
   pointing to BRIDGESCRIPTS/2HDMaa and BRIDGESCRIPTS/2HDM4TC_spec1

# Special notes
A. The Wino NLSP scenario has an undecayed W boson in every event
   therefore it is recommended that Pythia be used to decay it in 
   the desired way

B. The grid points in grid.HW.txt were used in Run I of the LHC

# How to run scripts
1. To generate slha files
./make_slha.sh WinoNLSP.cfg

2. To generate lhe files
./make_lhe.sh WinoNLSP.cfg

3. To generate MINIAODSIM files
./make_miniaodsim.sh WinoNLSP.cfg
