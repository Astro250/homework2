#!/bin/bash
#SBATCH -N 2
#SBATCH -C haswell
#SBATCH -p debug
#SBATCH -J jacobi_1
#SBATCH --mail-user=kelbadry@berkeley.edu
#SBATCH -t 00:10:00
#SBATCH --output=output_pure_mpi.txt

#OpenMP settings:
export OMP_NUM_THREADS=1
export OMP_PLACES=threads
export OMP_PROC_BIND=spread


#run the application:
time srun -n 64 -c 2 --cpu_bind=cores ./jacobi
