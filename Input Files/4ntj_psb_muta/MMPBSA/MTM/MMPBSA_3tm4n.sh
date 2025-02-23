#!/bin/bash

#SBATCH --job-name=4ntjmpm1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH --mem=6G
#SBATCH --partition=cpu

##SBATCH --nodelist=cpu-2-3

mpirun -np 4 MMPBSA.py.MPI -O -i MMPBSA.in \
				-sp 4ntj_psb_muta.prmtop \
				-cp complex.prmtop \
				-lp ligand.prmtop \
				-slp ~/mmpbsa_new/4ntj/PSB/70D/Opt/Ligand/psb.prmtop \
				-rp receptor.prmtop \
				-srp ~/mmpbsa_new/4ntj_muta/PSB/70D/Opt/Receptor_gaff/4ntj_rec_muta.prmtop \
				-y  ../05_Prod.crd \
				-yr ~/mmpbsa_new/4ntj_muta/PSB/70D/Opt/Receptor_gaff/rep1/05_Prod.crd \
				-yl ~/mmpbsa_new/4ntj/PSB/70D/Opt/Ligand/rep1/06_Prod.crd \
				-eo 4ntjmtmpm1.csv \
				-o  4ntjmtmpm1.dat \
				-A P 
				 
