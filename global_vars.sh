#!/bin/bash

# MicroBooNE
#source /cvmfs/uboone.opensciencegrid.org/products/setup_uboone.sh

# SBND
source /cvmfs/sbnd.opensciencegrid.org/products/sbnd/setup_sbnd.sh

#DUNE
#source /cvmfs/dune.opensciencegrid.org/products/dune/setup_dune.sh

setup sbndcode v09_82_02_01 -q e26:prof
#setup root v6_26_06b -q e26:p3913:prof
#setup lhapdf v6_5_3 -q e26:p3913:prof
#setup log4cpp v1_1_3a -q e17:debug
setup pdfsets v5_9_1b                                                           
setup gdb
setup git
setup cmake v3_14_3
