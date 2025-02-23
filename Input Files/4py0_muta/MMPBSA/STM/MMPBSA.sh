#!/bin/bash

#SBATCH --job-name=4py0m1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH --mem=6G
#SBATCH --partition=cpu

##SBATCH --nodelist=cpu-2-2

mpirun -np 4 MMPBSA.py.MPI -O -i MMPBSA.in \
				-sp 4py0_muta.prmtop \
				-cp complex.prmtop \
				-lp ligand.prmtop \
				-rp receptor.prmtop \
				-y  ../05_Prod.crd \
				-eo 4py0m1.csv \
				-o  4py0m1.dat \
				-A P 
