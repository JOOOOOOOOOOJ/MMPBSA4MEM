#!/bin/bash

#SBATCH --job-name=mtm4ntjpsbnmmu1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --cpus-per-task=1
#SBATCH --mem=6G
#SBATCH --partition=cpu-short

#SBATCH --nodelist=cpu-2-0

mpirun -np 8 MMPBSA.py.MPI -O -i Nmode.in \
				-sp trunc.4ntj_psb_muta.prmtop \
				-cp trunc.complex.prmtop \
				-lp ligand.prmtop \
				-slp ~/mmpbsa_new/4ntj/PSB/70D/Opt/Ligand/rep1/trunc.psb.prmtop \
				-rp trunc.receptor.prmtop \
				-srp ~/mmpbsa_new/4ntj_muta/PSB/70D/Opt/Receptor_gaff/rep1/trunc.4ntj_rec_muta.prmtop \
				-y  ../trunc_Prod.crd \
				-yr ~/mmpbsa_new/4ntj_muta/PSB/70D/Opt/Receptor_gaff/rep1/trunc_Prod.crd \
				-yl ~/mmpbsa_new/4ntj/PSB/70D/Opt/Ligand/rep1/trunc_Prod.crd \
				-eo mtm4ntjpsbnmmu1.csv \
				-o  mtm4ntjpsbnmmu1.dat \
				-A P 
				 
