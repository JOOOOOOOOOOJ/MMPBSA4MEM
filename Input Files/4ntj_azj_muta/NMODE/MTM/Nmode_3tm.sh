#!/bin/bash

#SBATCH --job-name=mtm4ntjnmmu1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --cpus-per-task=1
#SBATCH --mem=6G
#SBATCH --partition=cpu-long

##SBATCH --nodelist=cpu-2-1

mpirun -np 8 MMPBSA.py.MPI -O -i Nmode.in \
				-sp trunc.4ntj_azd_big_muta.prmtop \
				-cp trunc.complex.prmtop \
				-lp ligand.prmtop \
				-slp ~/mmpbsa_new/4ntj/AZJ/70D/Opt/Ligand/big/rep1/trunc.azd_big.prmtop \
				-rp trunc.receptor.prmtop \
				-srp ~/mmpbsa_new/4ntj_muta/AZJ/70D/Opt/Receptor/rep1/trunc.4ntj_rec_muta.prmtop \
				-y  ../trunc_Prod.crd \
				-yr ~/mmpbsa_new/4ntj_muta/AZJ/70D/Opt/Receptor/rep1/trunc_Prod.crd \
				-yl ~/mmpbsa_new/4ntj/AZJ/70D/Opt/Ligand/big/rep1/trunc_Prod.crd \
				-eo mtm4ntjnmmu1.csv \
				-o  mtm4ntjnmmu1.dat \
				-A P 
				 
