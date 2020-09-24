#!/bin/bash

#===================================================================#
# allrun script for testcase as part of test routine 
# run ErgunTestMPI
# Christoph Goniva - Sept. 2010
#===================================================================#

#- define variables
casePath="$(dirname "$(readlink -f ${BASH_SOURCE[0]})")"


#-----------------------restart-------------------------#
# adapt settings for init or restart run
cp $casePath/CFD/constant/liggghtsCommands_restart $casePath/CFD/constant/liggghtsCommands
cp $casePath/CFD/constant/couplingProperties_restart $casePath/CFD/constant/couplingProperties
cp $casePath/CFD/system/controlDict_restart $casePath/CFD/system/controlDict

#- run parallel CFD-DEM in new terminal
#gnome-terminal --title='cfdemSolverPiso ErgunTestMPI_restart CFD'  -e "bash $casePath/parCFDDEMrun.sh" 

. $casePath/parCFDDEMrun.sh



