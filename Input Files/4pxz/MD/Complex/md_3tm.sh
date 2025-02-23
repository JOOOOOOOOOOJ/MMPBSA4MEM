#!/bin/bash
#SBATCH --job-name=4pxz1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=6G
#SBATCH --partition=gpu
#SBATCH --exclude=gpu-1-5
# Define paths to required software and libraries
#export AMBERHOME=/home3/apps/amber24
#export PATH=$PATH:/bin:/usr/bin
export PATH=/bin:/usr/bin:$PATH
#export PATH=/home/apps/openmpi/4.1.5/bin

pmemd=$AMBERHOME/bin/pmemd.cuda
pmemd_mpi=$AMBERHOME/bin/pmemd
echo "AMBERHOME = $AMBERHOME"
echo "LD_LIBRARY_PATH = $LD_LIBRARY_PATH"
echo "HOSTNAME = #HOSTNAME"

echo "starting 1min"

#wrk=/tmp/cizhang_MD_$$
#cwrk=$(pwd)
#echo "Working Directory"
#echo $cwrk
#
#if [ -d $wrk ]; then
#	echo "Local job folder already exist!"
#	echo "Removing folder:",$wrk
#	rm -rf $wrk
#fi
#

#mkdir $wrk
#echo "Temporary folder"
#echo $wrk
#cp $cwrk/*.prmtop $wrk
#cp $cwrk/*.inpcrd $wrk
#cp $cwrk/0*.in $wrk

#cd $wrk
#
${pmemd_mpi} -O -i 01_Min.in -p 4pxz.prmtop -c 4pxz.inpcrd -o 01_Min.out -r 01_Min.rst -x 01_Min.crd -ref 4pxz.inpcrd

echo "ending 1min"

echo "starting 2mdheat"

${pmemd} -O -i 02_Heat.in -p 4pxz.prmtop -c 01_Min.rst -o 02_Heat.out -r 02_Heat.rst -x 02_Heat.crd -ref 01_Min.rst

echo "ending 2mdheat"

echo "starting 3mdhold"

${pmemd} -O -i 03_Hold.in -p 4pxz.prmtop -c 02_Heat.rst -o 03_Hold.out -r 03_Hold.rst -x 03_Hold.crd -ref 02_Heat.rst

echo "ending 3mdhold"

echo "starting 4mdhold"

${pmemd} -O -i 04_Hold.in -p 4pxz.prmtop -c 03_Hold.rst -o 04_Hold.out -r 04_Hold.rst -x 04_Hold.crd

echo "ending 4mdhold"

echo "starting 5mdprod"

${pmemd} -O -i 05_Prod.in -p 4pxz.prmtop -c 04_Hold.rst -o 05_Prod.out -r 05_Prod.rst -x 05_Prod.crd

echo "ending 5mdprod"

#cp *.crd $cwrk
#cp *.rst $cwrk
#cp *.out $cwrk
#cd $cwrk
#rm -r $wrk
# echo "starting 6mdexte at $(date)"

# ${pmemd} -O -i 06_Exte.in -o 06Exte.out -p .prmtop -c 05Prod.rst -r 06Exte.rst -ref 05Prod.rst -x 06.Exte.crd

# echo "ending 6exte at $(date)"

# echo "starting 7mdexte at $(date)"

# ${pmemd} -O -i 07_Exte.in -o 07Exte.out -p .prmtop -c 06Exte.rst -r 07Exte.rst -ref 06Exte.rst -x 07.Exte.crd

# echo "ending 7exte at $(date)"
sleep 3600
