#!/usr/bin/env python

####################################################
#                                                  #  
# Author: Christian & Emmanuel Contreras-Campana   #
# Email: <chrisjcc@physics.rutgers.edu>            #
# Email: <ecampana$physics.rutgers.edu>            #
# Date: July 3rd, 2013                             #
#                                                  # 
#################################################### 

import sys
import os
import re

# Description: Usage to convert decayed lhe file into DataOps lhe format
# python lheDataOps.py UNDECAYED.lhe DECAYED.lhe
# execute: ./lheDataOps.py UNDECAYED.lhe DECAYED.lhe

# Keeps track of header block
headerswitch = False

# Keeps track of event block
eventinfo = []  # Store event listing
eventswitch = False

# Keep track of event number
index = 0

# Keep track of line number in an event
linenumber = 0

# Set parameters to command line arguments
outputfilename    = re.sub(r'\.lhe', '', os.path.basename(sys.argv[2]))+"_official.lhe"

# Open this LHE file
undecayedfile = open(sys.argv[1],'r')     # undecayed lhe file where hash tags will be grabed from
decayedfile   = open(sys.argv[2], 'r')    # decayed lhe file which will be appended to
outputfile    = open(outputfilename, 'w') # out file name

# Capature chargino key from file name
modelname = re.sub(r'\.lhe', '', os.path.basename(sys.argv[2])) # model name added to lhe file
name = re.compile('(chargino\d+)_.*', re.DOTALL)

# Read file into memory
lines = decayedfile.readlines()

# Read file into memory
phrase = undecayedfile.readlines()

# Array with hash tags
hashArray = []

# Array with clustering information
clusteringArray = []

# Regex pattern
regex = '(#\s*\d.+\.\d.*)'
regex2 = '(<clus scale=\"\s*\d*\.\d*\">\s*.\d*\s*.\d*\s*.\d*\s*.\d</clus>)'

r = re.compile(regex, re.DOTALL)
r2 = re.compile(regex2, re.DOTALL)

# Loop over in memory list containing lines from file
for word in phrase:
    for match in r.finditer(word):
        hashArray.append(match.group(1))

    for match in r2.finditer(word):
        clusteringArray.append(match.group(1))

# Removing unwanted matchtes
hashArray.pop(0)

# Start looping over lines in LHE file
for line in lines:

    # Find cross section of physics model
    if "Integrated weight (pb)" in line:
        xsection = line.split(":")[1].strip()

    # Find begining of LHE header
    if line.find("<LesHouchesEvents version=\"1.0\">")>=0:
        outputfile.writelines(line)
        headerswitch = True
        continue

    # Print lines in header block
    if headerswitch==True and line.find("</init>")<0:
        outputfile.writelines(line)
        continue

    # Print end of header and initialization block
    if headerswitch==True and line.find("</init>")>=0:
        outputfile.writelines(line)
        headerswitch = False
        continue

    # Find begining of event
    if line.find("<event>")>=0:
        eventinfo.append(line)
        eventswitch = True
        continue

    # Process event block
    if eventswitch==True:
        # Now append event block info
        if line.find("</event>")<0:
            eventinfo.append(line)

        # Now append new hash tag info (model, modelname, xsection)
        if line.find("</event>")>=0:
            eventinfo.append(hashArray[index])
            eventinfo.append("#  model "+modelname+" "+xsection+"\n")        
            eventinfo.append("<clustering>\n")

            # Now append clustering information
            for i in range(linenumber, linenumber + len(hashArray[index].split()) - 1):
                eventinfo.append(clusteringArray[i]+"\n")

            # Now append end of clustering and event blocks
            eventinfo.append("</clustering>\n")
            eventinfo.append("</event>\n")

            outputfile.writelines(eventinfo)

            linenumber += len(hashArray[index].split()) - 1
            index += 1
            eventinfo = []
            eventswitch = False

# End off LesHouchesEvents tag
outputfile.write("</LesHouchesEvents>\n")

# Close output file
outputfile.close()
undecayedfile.close()
decayedfile.close()
