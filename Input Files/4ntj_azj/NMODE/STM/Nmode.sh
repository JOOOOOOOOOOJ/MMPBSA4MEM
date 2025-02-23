#!/bin/bash

#SBATCH --job-name=4ntjnm1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --cpus-per-task=1
#SBATCH --mem=6G
#SBATCH --partition=cpu-long

##SBATCH --nodelist=cpu-2-1

mpirun -np 8 MMPBSA.py.MPI -O -i Nmode.in \
				-sp trunc.4ntj_azd_big.prmtop \
				-cp trunc.complex.prmtop \
				-lp ligand.prmtop \
				-rp trunc.receptor.prmtop \
				-y  ../trunc_Prod.crd \
				-eo 4ntjnm1.csv \
				-o  4ntjnm1.dat \
				-A P 
