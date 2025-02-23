# Project Overview
This repository consists of three main sections:

## 1. Input Files
Each system has its own unique directory, with input files categorized into six components:

### (1) antechamber4ligand
This directory contains files used for ligand preparation in tLEaP, along with the corresponding output files.

### (2) MD
The "MD" section is further divided into "Complex," "Receptor," and "Ligand." Topology (`.prmtop`) and coordinate (`.inpcrd`) files referenced in the scripts (`.sh`) are stored in the "tleap" directory.

### (3) tleap
Like the "MD" section, "tleap" is divided into "Complex," "Receptor," and "Ligand." Some input files for "Complex" and "Ligand" reference files located in other directories. For example, ligand structure files required for "Complex" or "Ligand" tLEaP setup are stored in "antechamber4ligand."

### (4) MMPBSA & (5) NMODE
- The "MMPBSA" and "NMODE" directories contain "STM" and "MTM" subdirectories, which represent different calculation methods.
- In "MMPBSA," topology files for complex, receptor, and ligand (including solvent) are located in the corresponding "tleap" folder.
- In "NMODE":
  - `splitup*.in` files split topology files (without solvent) used in MMPBSA (`complex.prmtop`, `receptor.prmtop`, `ligand.prmtop`), generating `trunc.*.prmtop` files.
  - `truncation*.in` files truncate trajectories (with solvent), producing corresponding topology and trajectory files.
  - Most topology files required in the scripts (`.sh`) are in the same path, except for `ligand.prmtop`, which is located in the "MMPBSA" directory.

### (6) MGBinding
This section is specific to agonist-binding systems, containing input files for calculating binding free energy between an agonist and Mg²⁺. To accurately model interactions, a 12-6-4 Lennard-Jones (LJ) nonbonded model is built using `parmed` following Amber tutorial guidelines.

### Important Notes:
1. As mentioned in the article, all mutants share the same ligand topology and trajectory as the wild-type, explaining why the "MD" and "tleap" directories for mutants do not include a "Ligand" section.
2. Since ligands TIQ and AZJ share the same protein receptor structure, and PSB shares the receptor structure with 6AD and 6AT, the "Receptor" folders in "MD" and "tleap" are missing for `4ntj_tiq`, `4ntj_tiq_muta`, `4pxz`, `4pxz_muta`, `4py0`, and `4py0_muta`.
3. All input files apply to the GAFF2 force field for ligands. For simulations using the GAFF force field, simply modify the relevant settings to GAFF.

## 2. Raw Data
This section contains the results of MMPBSA and Normal Mode Entropy calculations:
- `ad_mg_gaff`, `ad_mg_gaff2`, `at_mg_gaff`, `at_mg_gaff2`: MMPBSA results for agonist-Mg²⁺ interactions (`ad` refers to 6AD in 4pxz, `at` refers to 6AT in 4py0; "gaff" and "gaff2" indicate different force fields).
- `mmpbsa_data_gaff`, `mmpbsa_data_gaff2`, `nmode_data_gaff`, `nmode_data_gaff2`: Results from MMPBSA and Normal Mode Entropy calculations for different systems, with "gaff" and "gaff2" representing force fields for ligands.
- Both MMPBSA and Normal Mode Entropy calculations produce `.dat` and `.csv` files. The `.csv` files contain detailed descriptions of each computed term.
- `PDB_structure`: Contains protein structures processed with Modeller to add missing non-terminal loops.

## 3. Data Analysis
This section includes Python scripts for processing raw data and generating visualizations.
