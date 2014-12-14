#!/bin/sh
# ------------------------------------------------------------------
# [BoriS] deploy
#          script that deploys EMF from the tmp folder
# ------------------------------------------------------------------

OUTFILE=`pwd`/out.txt
rm -rf /tmp/emf
mkdir /tmp/emf
cp scripts/* /tmp/emf/
cd /tmp/emf
sh main.sh > $OUTFILE 2>&1
cd ..
rm -rf /tmp/eati
