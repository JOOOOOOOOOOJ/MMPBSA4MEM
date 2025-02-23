#!/bin/bash

#SBATCH --job-name=6admg1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH --mem=6G
#SBATCH --partition=cpu-short

##SBATCH --nodelist=cpu-2-0

mpirun -np 4 MMPBSA.py.MPI -O -i MMPBSA.in \
				-sp 6ad_mg_1264.prmtop \
				-cp complex.prmtop \
				-lp ligand.prmtop \
				-rp receptor.prmtop \
				-y  ../06_Prod.crd \
				-eo 6admg1.csv \
				-o  6admg1.dat \
				-A P 
