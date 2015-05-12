# Instructions after checking out repository

# 1. Update the MAINDIR shell variable in WinoNLSP.cfg with your current 
# working path

# 2. To generate slha file
./make_slha.sh WinoNLSP.cfg

# 3. To generate lhe file
./make_lhe.sh WinoNLSP.cfg

# 4. To generate MINIAODSIM files
./make_miniaodsim.sh WinoNLSP.cfg

# Special instructions
# A. You will need to download MadGraph5 v2.1.1 or later,
# as well as the BRIDGE software

# B. You will need to download BRIDGE v2.24 or later and 
# then properly compile it using directions found in the 
# RutgersMCGuide_temp.pdf document

# C. Update the following files in the BRIDGESCRIPTS directory:
# DECAYRUNNER.sh, DGERUNNER.sh, DGERUNNERsing.sh, and MIXDECAYDGERUNNER.sh 
# by changing the shell variable MGdir to point to your current MadGraph5 
# directory while runhiggsinohdecays.sh and runhiggsinohdecaysgamma.sh 
# should point to your current BRIDGESCRIPTS directory

# D. Lastly, create a solf link in the MadGraph models directory
# pointing to BRIDGESCRIPTS/2HDMaa and BRIDGESCRIPTS/2HDM4TC_spec1

# Special notes
# A. The Wino NLSP scenario has an undecayed W boson in every event
# therefore it is recommended that Pythia be used to decay it in 
# the desired way
