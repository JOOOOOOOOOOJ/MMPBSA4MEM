#!/bin/bash

#SBATCH --job-name=4ntjmtm1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH --mem=6G
#SBATCH --partition=gpu

##SBATCH --nodelist=cpu-2-0

mpirun -np 4 MMPBSA.py.MPI -O -i MMPBSA.in \
				-sp 4ntj_tiq_muta.prmtop \
				-cp complex.prmtop \
				-lp ligand.prmtop \
				-slp ~/mmpbsa_new/4ntj/TIQ/70D/Opt/Ligand/tiq.prmtop \
				-rp receptor.prmtop \
				-srp ~/mmpbsa_new/4ntj_muta/AZJ/70D/Opt/Receptor/4ntj_rec_muta.prmtop \
				-y  ../05_Prod.crd \
				-yr ~/mmpbsa_new/4ntj_muta/AZJ/70D/Opt/Receptor/rep1/05_Prod.crd \
				-yl ~/mmpbsa_new/4ntj/TIQ/70D/Opt/Ligand/rep1/06_Prod.crd \
				-eo 4ntjmtmtm1.csv \
				-o  4ntjmtmtm1.dat \
				-A P 
				 
