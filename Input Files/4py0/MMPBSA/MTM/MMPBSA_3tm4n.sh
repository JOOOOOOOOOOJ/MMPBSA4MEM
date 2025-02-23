#!/bin/bash

#SBATCH --job-name=4py0mtm1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH --mem=6G
#SBATCH --partition=cpu

##SBATCH --nodelist=cpu-2-2

mpirun -np 4 MMPBSA.py.MPI -O -i MMPBSA.in \
				-sp 4py0.prmtop \
				-cp complex.prmtop \
				-lp ligand.prmtop \
				-slp ../../Ligand/6at.prmtop \
				-rp receptor.prmtop \
				-srp ~/mmpbsa_new/4ntj/PSB/70D/Opt/Receptor_gaff/4ntj_rec.prmtop \
				-y  ../05_Prod.crd \
				-yr ~/mmpbsa_new/4ntj/PSB/70D/Opt/Receptor_gaff/rep1/05_Prod.crd \
				-yl ../../Ligand/rep1/06_Prod.crd \
				-eo 4py0mtm1.csv \
				-o  4py0mtm1.dat \
				-A P 
				 
