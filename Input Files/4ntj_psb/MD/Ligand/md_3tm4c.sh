#!/bin/bash
#SBATCH --job-name=psb1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --cpus-per-task=1
#SBATCH --mem=6G
#SBATCH --partition=cpu


# Define paths to required software and libraries
#export CUDA_HOME=/home/apps/cuda-12.1
#export AMBERHOME=/home/apps/amber23
#export LD_LEBRARY_PATH=/home/apps/cuda-12.1/lib64:/home/apps/openmpi/4.1.5/lib:$LD_LEBRARY_PATH
#export PATH=/home/apps/cuda-12.1/bin:/home/apps/openmpi/4.1.5/bin:$PATH
#export PATH=$PATH:/bin:/usr/bin
##export PATH=/home/apps/openmpi/4.1.5/bin
#
#job=user_jojo
pmemd=$AMBERHOME/bin/pmemd.cuda
pmemd_mpi=$AMBERHOME/bin/pmemd.MPI
echo "AMBERHOME = $AMBERHOME"
echo "LD_LIBRARY_PATH = $LD_LIBRARY_PATH"
echo "HOSTNAME = #HOSTNAME"

#pdb_name=psb
#echo "${pdb_name}job"

echo "starting 1min"

mpirun -np 8 ${pmemd_mpi} -O -i 01_Min.in -p psb.prmtop -c psb.inpcrd -o 01_Min.out -r 01_Min.rst -x 01_Min.crd -ref psb.inpcrd

echo "ending 1min"

echo "starting 2mdheat"

mpirun -np 8 ${pmemd_mpi} -O -i 02_Heat.in -p psb.prmtop -c 01_Min.rst -o 02_Heat.out -r 02_Heat.rst -x 02_Heat.crd -ref 01_Min.rst

echo "ending 2mdheat"

echo "starting 3mdhold"

mpirun -np 8 ${pmemd_mpi} -O -i 03_Hold.in -p psb.prmtop -c 02_Heat.rst -o 03_Hold.out -r 03_Hold.rst -x 03_Hold.crd -ref 02_Heat.rst

echo "ending 3mdhold"

echo "starting 4mdhold"

mpirun -np 8 ${pmemd_mpi} -O -i 04_Hold.in -p psb.prmtop -c 03_Hold.rst -o 04_Hold.out -r 04_Hold.rst -x 04_Hold.crd

echo "ending 4mdhold"

echo "starting 5mdhold"

mpirun -np 8 ${pmemd_mpi} -O -i 05_Hold.in -p psb.prmtop -c 04_Hold.rst -o 05_Hold.out -r 05_Hold.rst -x 05_Hold.crd

echo "ending 5mdhold"

echo "starting 6mdprod"

mpirun -np 8 ${pmemd_mpi} -O -i 06_Prod.in -p psb.prmtop -c 05_Hold.rst -o 06_Prod.out -r 06_Prod.rst -x 06_Prod.crd

echo "ending 6mdprod"

