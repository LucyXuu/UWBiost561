#!/bin/bash

#SBATCH --job-name=hw4-simulation
#SBATCH --account=biostat
#SBATCH --partition=students-12c128g

#SBATCH --time=12:00:00
#SBATCH --mem-per-cpu=10gb

# Run your R script
R CMD BATCH --no-save --no-restore vignettes/HW4_simulation_execute.R
