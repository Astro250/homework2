#!/bin/bash
#SBATCH -N 2
#SBATCH -C haswell
#SBATCH -p debug
#SBATCH -J jacobi_1
#SBATCH --mail-user=kelbadry@berkeley.edu
#SBATCH -t 00:10:00
#SBATCH --output=output_pure_openmp.txt

#OpenMP settings:
export OMP_NUM_THREADS=64
export OMP_PLACES=threads
export OMP_PROC_BIND=spread


#run the application:
time srun -n 2 -c 64 --cpu_bind=cores ./jacobi
