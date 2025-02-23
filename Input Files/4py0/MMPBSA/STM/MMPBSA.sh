#!/bin/bash

#SBATCH --job-name=4py01
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH --mem=6G
#SBATCH --partition=cpu-short

#SBATCH --nodelist=cpu-2-0

mpirun -np 4 MMPBSA.py.MPI -O -i MMPBSA.in \
				-sp 4py0.prmtop \
				-cp complex.prmtop \
				-lp ligand.prmtop \
				-rp receptor.prmtop \
				-y  ../05_Prod.crd \
				-eo 4py01.csv \
				-o  4py01.dat \
				-A P 
