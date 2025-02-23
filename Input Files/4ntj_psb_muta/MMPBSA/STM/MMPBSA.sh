#!/bin/bash

#SBATCH --job-name=4ntjpm1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH --mem=6G
#SBATCH --partition=cpu

##SBATCH --nodelist=cpu-2-5

mpirun -np 4 MMPBSA.py.MPI -O -i MMPBSA.in \
				-sp 4ntj_psb_muta.prmtop \
				-cp complex.prmtop \
				-lp ligand.prmtop \
				-rp receptor.prmtop \
				-y  ../05_Prod.crd \
				-eo 4ntjpm1.csv \
				-o  4ntjpm1.dat \
				-A P 
