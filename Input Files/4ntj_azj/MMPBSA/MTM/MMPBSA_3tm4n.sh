#!/bin/bash

#SBATCH --job-name=4ntjbig1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH --mem=6G
#SBATCH --partition=cpu

##SBATCH --nodelist=cpu-2-1

mpirun -np 4 MMPBSA.py.MPI -O -i MMPBSA.in \
				-sp 4ntj_azd_big.prmtop \
				-cp complex.prmtop \
				-lp ligand.prmtop \
				-slp ../../../../Ligand/big/azd_big.prmtop \
				-rp receptor.prmtop \
				-srp ../../../../Receptor/4ntj_rec.prmtop \
				-y  ../05_Prod.crd \
				-yr ../../../../Receptor/rep1/05_Prod.crd \
				-yl ../../../../Ligand/big/rep1/06_Prod.crd \
				-eo 4ntjmtmbig1.csv \
				-o  4ntjmtmbig1.dat \
				-A P 
				 
