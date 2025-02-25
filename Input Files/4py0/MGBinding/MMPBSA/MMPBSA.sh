#!/bin/bash

#SBATCH --job-name=6atmg1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=1
#SBATCH --mem=6G
#SBATCH --partition=cpu-short

##SBATCH --nodelist=cpu-2-0

mpirun -np 2 MMPBSA.py.MPI -O -i MMPBSA.in \
				-sp 6at_mg_1264.prmtop \
				-cp complex.prmtop \
				-lp ligand.prmtop \
				-rp receptor.prmtop \
				-y  ../06_Prod.crd \
				-eo 6atmg1.csv \
				-o  6atmg1.dat \
				-A P 
