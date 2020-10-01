#!/bin/bash

#===================================================================#
# allrun script for testcase as part of test routine 
# run ErgunTestMPI
# Christoph Goniva - Sept. 2010
#===================================================================#

#- define variables
casePath="$(dirname "$(readlink -f ${BASH_SOURCE[0]})")"

# check if mesh was built
#if [ -f "$casePath/CFD/constant/polyMesh/points" ]; then
#    echo "mesh was built before - using old mesh"
#else
#    echo "mesh needs to be built"
#    cd $casePath/CFD
#    blockMesh
#    snappyHexMesh -overwrite
#fi

#if [ -f "$casePath/DEM/post/restart/liggghts.restart" ];  then
#    echo "LIGGGHTS init was run before - using existing restart file"
#else
#    #- run DEM in new terminal
#    $casePath/parDEMrun.sh
#fi

#-------------------------------------------------------#
# adapt settings for init run
#cp $casePath/CFD/constant/liggghtsCommands_run $casePath/CFD/constant/liggghtsCommands
#cp $casePath/CFD/constant/couplingProperties_run $casePath/CFD/constant/couplingProperties
#cp $casePath/CFD/system/controlDict_run $casePath/CFD/system/controlDict
#-------------------------------------------------------#

#- run parallel CFD-DEM in new terminal
#gnome-terminal --title='cfdemSolverPiso ErgunTestMPI_restart CFD'  -e "bash $casePath/parCFDDEMrun.sh" 
#. $casePath/parCFDDEMrun.sh

#- wait until sim has finished then run octave
#echo "simulation finished? ...press enter to proceed"
#read


#-----------------------restart-------------------------#
# adapt settings for init or restart run
cp $casePath/CFD/constant/liggghtsCommands_restart $casePath/CFD/constant/liggghtsCommands
cp $casePath/CFD/constant/couplingProperties_restart $casePath/CFD/constant/couplingProperties
cp $casePath/CFD/system/controlDict_restart $casePath/CFD/system/controlDict

#- run parallel CFD-DEM in new terminal
#gnome-terminal --title='cfdemSolverPiso ErgunTestMPI_restart CFD'  -e "bash $casePath/parCFDDEMrun.sh" 

. $casePath/parCFDDEMrun.sh



