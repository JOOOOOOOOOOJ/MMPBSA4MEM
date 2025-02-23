#!/bin/bash

#SBATCH --job-name=4ntjbm1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH --mem=6G
#SBATCH --partition=cpu

##SBATCH --nodelist=cpu-2-3

mpirun -np 4 MMPBSA.py.MPI -O -i MMPBSA.in \
				-sp 4ntj_azd_big_muta.prmtop \
				-cp complex.prmtop \
				-lp ligand.prmtop \
				-slp ~/mmpbsa_new/4ntj/AZJ/70D/Opt/Ligand/big/azd_big.prmtop \
				-rp receptor.prmtop \
				-srp ../../../../Receptor/4ntj_rec_muta.prmtop \
				-y  ../05_Prod.crd \
				-yr ../../../../Receptor/rep1/05_Prod.crd \
				-yl ~/mmpbsa_new/4ntj/AZJ/70D/Opt/Ligand/big/rep1/06_Prod.crd \
				-eo 4ntjmtmbm1.csv \
				-o  4ntjmtmbm1.dat \
				-A P 
				 
