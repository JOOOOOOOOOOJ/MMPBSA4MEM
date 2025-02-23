#!/bin/bash

#SBATCH --job-name=mtm4py0nm1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --cpus-per-task=1
#SBATCH --mem=6G
#SBATCH --partition=cpu-short

#SBATCH --nodelist=cpu-2-1

mpirun -np 8 MMPBSA.py.MPI -O -i Nmode.in \
				-sp trunc.4py0.prmtop \
				-cp trunc.complex.prmtop \
				-lp ligand.prmtop \
				-slp ~/mmpbsa_new/4py0/70D/Opt/Ligand/rep1/trunc.6at.prmtop \
				-rp trunc.receptor.prmtop \
				-srp ~/mmpbsa_new/4ntj/PSB/70D/Opt/Receptor_gaff/rep1/trunc_6at.4ntj_rec.prmtop \
				-y  ../trunc_Prod.crd \
				-yr ~/mmpbsa_new/4ntj/PSB/70D/Opt/Receptor_gaff/rep1/trunc_6at_Prod.crd \
				-yl ~/mmpbsa_new/4py0/70D/Opt/Ligand/rep1/trunc_Prod.crd \
				-eo mtm4py0nm1.csv \
				-o  mtm4py0nm1.dat \
				-A P 
				 
