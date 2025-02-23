#!/bin/bash

#SBATCH --job-name=4ntjt1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH --mem=6G
#SBATCH --partition=gpu

##SBATCH --nodelist=cpu-2-2

mpirun -np 4 MMPBSA.py.MPI -O -i MMPBSA.in \
				-sp 4ntj_tiq.prmtop \
				-cp complex.prmtop \
				-lp ligand.prmtop \
				-slp ../../../Ligand/tiq.prmtop \
				-rp receptor.prmtop \
				-srp ~/mmpbsa_new/4ntj/AZJ/70D/Opt/Receptor/4ntj_rec.prmtop \
				-y  ../05_Prod.crd \
				-yr ~/mmpbsa_new/4ntj/AZJ/70D/Opt/Receptor/rep1/05_Prod.crd \
				-yl ../../../Ligand/rep1/06_Prod.crd \
				-eo 4ntjmtmt1.csv \
				-o  4ntjmtmt1.dat \
				-A P 
				 
