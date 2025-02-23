#!/bin/bash

#SBATCH --job-name=mtm4pxznmmu1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --cpus-per-task=1
#SBATCH --mem=6G
#SBATCH --partition=cpu-short

#SBATCH --nodelist=cpu-2-1

mpirun -np 8 MMPBSA.py.MPI -O -i Nmode.in \
				-sp trunc.4pxz_muta.prmtop \
				-cp trunc.complex.prmtop \
				-lp ligand.prmtop \
				-slp ~/mmpbsa_new/4pxz/70D/Opt/Ligand/rep1/trunc.6ad.prmtop \
				-rp trunc.receptor.prmtop \
				-srp ~/mmpbsa_new/4ntj_muta/PSB/70D/Opt/Receptor_gaff/rep1/trunc_6ad_muta.4ntj_rec_muta.prmtop \
				-y  ../trunc_Prod.crd \
				-yr ~/mmpbsa_new/4ntj_muta/PSB/70D/Opt/Receptor_gaff/rep1/trunc_6ad_muta_Prod.crd \
				-yl ~/mmpbsa_new/4pxz/70D/Opt/Ligand/rep1/trunc_Prod.crd \
				-eo mtm4pxznmmu1.csv \
				-o  mtm4pxznmmu1.dat \
				-A P 
				 
