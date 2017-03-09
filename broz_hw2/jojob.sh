#!/bin/bash
#SBATCH -N 2
#SBATCH -C haswell
#SBATCH -p debug
#SBATCH -J job
#SBATCH --mail-user=jbroz@berkeley.edu
#SBATCH -t 00:30:00
#SBATCH -o 32threads_6nodes_32cores.out

#OpenMP settings:
export OMP_NUM_THREADS=32
export OMP_PLACES=threads
export OMP_PROC_BIND=spread


#run the application:
time srun -n 6 -c 32 --cpu_bind=cores /global/homes/j/jbroz/hw2/jacobi

