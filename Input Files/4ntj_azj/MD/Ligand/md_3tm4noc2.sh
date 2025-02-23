#!/bin/bash
#SBATCH --job-name=azd_big1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --cpus-per-task=1
#SBATCH --mem=6G
#SBATCH --partition=gpu

#SBATCH --exclude=gpu-1-5

# Define paths to required software and libraries
#export CUDA_HOME=/home/apps/cuda-12.1
#export AMBERHOME=/home/czzhao/amber24
#export LD_LEBRARY_PATH=/home/apps/cuda-12.1/lib64:/home/apps/openmpi/4.1.5/lib:$LD_LEBRARY_PATH
#export PATH=/home/apps/cuda-12.1/bin:/home/apps/openmpi/4.1.5/bin:$PATH
#export PATH=$PATH:/bin:/usr/bin
#export PATH=/home/apps/openmpi/4.1.5/bin

job=user_jojo
pmemd=$AMBERHOME/bin/pmemd.cuda
pmemd_mpi=$AMBERHOME/bin/pmemd.MPI
echo "AMBERHOME = $AMBERHOME"
echo "LD_LIBRARY_PATH = $LD_LIBRARY_PATH"
#echo "HOSTNAME = #HOSTNAME"

echo "starting 5mdhold"

${pmemd} -O -i 05_Hold.in -p azd_big.prmtop -c 04_Hold.rst -o 05_Hold.out -r 05_Hold.rst -x 05_Hold.crd

echo "ending 5mdhold"

echo "starting 6mdprod"

${pmemd} -O -i 06_Prod.in -p azd_big.prmtop -c 05_Hold.rst -o 06_Prod.out -r 06_Prod.rst -x 06_Prod.crd

echo "ending 6mdprod"

