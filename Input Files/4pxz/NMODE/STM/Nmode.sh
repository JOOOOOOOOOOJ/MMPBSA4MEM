#!/bin/bash

#SBATCH --job-name=4pxznm1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --cpus-per-task=1
#SBATCH --mem=6G
#SBATCH --partition=cpu-short

#SBATCH --nodelist=cpu-2-0

mpirun -np 8 MMPBSA.py.MPI -O -i Nmode.in \
				-sp trunc.4pxz.prmtop \
				-cp trunc.complex.prmtop \
				-lp ligand.prmtop \
				-rp trunc.receptor.prmtop \
				-y  ../trunc_Prod.crd \
				-eo 4pxznm1.csv \
				-o  4pxznm1.dat \
				-A P 
