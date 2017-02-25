#!/bin/bash
#SBATCH -N 2
#SBATCH -C haswell
#SBATCH -p debug
#SBATCH -J jacobi_1
#SBATCH --mail-user=kelbadry@berkeley.edu
#SBATCH -t 00:10:00
#SBATCH --output=output_8_and_8.txt

#OpenMP settings:
export OMP_NUM_THREADS=8
export OMP_PLACES=threads
export OMP_PROC_BIND=spread


#run the application:
time srun -n 16 -c 8 --cpu_bind=cores ./jacobi
