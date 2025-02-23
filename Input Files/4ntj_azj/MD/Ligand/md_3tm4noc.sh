#!/bin/bash
#SBATCH --job-name=azd_big1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --cpus-per-task=1
#SBATCH --mem=6G
#SBATCH --partition=cpu
##SBATCH --nodelist=cpu-2-7

# Define paths to required software and libraries
#export AMBERHOME=/home8/apps/amber24
#export PATH=$PATH:/bin:/usr/bin
#export PATH=/home/apps/openmpi/4.1.5/bin

job=user_jojo
pmemd=$AMBERHOME/bin/pmemd.cuda
pmemd_mpi=$AMBERHOME/bin/pmemd.MPI
echo "AMBERHOME = $AMBERHOME"
echo "LD_LIBRARY_PATH = $LD_LIBRARY_PATH"

echo "starting 1min"

mpirun -np 8 ${pmemd_mpi} -O -i 01_Min.in -p azd_big.prmtop -c azd_big.inpcrd -o 01_Min.out -r 01_Min.rst -x 01_Min.crd -ref azd_big.inpcrd

echo "ending 1min"

echo "starting 2mdheat"

mpirun -np 8 ${pmemd_mpi} -O -i 02_Heat.in -p azd_big.prmtop -c 01_Min.rst -o 02_Heat.out -r 02_Heat.rst -x 02_Heat.crd -ref 01_Min.rst

echo "ending 2mdheat"

echo "starting 3mdhold"

mpirun -np 8 ${pmemd_mpi} -O -i 03_Hold.in -p azd_big.prmtop -c 02_Heat.rst -o 03_Hold.out -r 03_Hold.rst -x 03_Hold.crd -ref 02_Heat.rst

echo "ending 3mdhold"

echo "starting 4mdhold"

mpirun -np 8 ${pmemd_mpi} -O -i 04_Hold.in -p azd_big.prmtop -c 03_Hold.rst -o 04_Hold.out -r 04_Hold.rst -x 04_Hold.crd

echo "ending 4mdhold"


