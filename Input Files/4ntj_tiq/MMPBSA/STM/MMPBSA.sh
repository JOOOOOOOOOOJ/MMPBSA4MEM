#!/bin/bash

#SBATCH --job-name=4ntjst1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH --mem=6G
#SBATCH --partition=gpu

##SBATCH --nodelist=cpu-2-5

mpirun -np 4 MMPBSA.py.MPI -O -i MMPBSA.in \
				-sp 4ntj_tiq.prmtop \
				-cp complex.prmtop \
				-lp ligand.prmtop \
				-rp receptor.prmtop \
				-y  ../05_Prod.crd \
				-eo 4ntjt1.csv \
				-o  4ntjt1.dat \
				-A P 
