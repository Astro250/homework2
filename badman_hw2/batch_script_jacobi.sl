#!/bin/bash
#SBATCH -N 2
#SBATCH -C haswell
#SBATCH -p regular
#SBATCH -J Jacobi_Test_0
#SBATCH --mail-user=samuel_badman@berkeley.edu
#SBATCH -t 01:00:00

#OpenMP settings:
export OMP_NUM_THREADS=1
export OMP_PLACES=threads
export OMP_PROC_BIND=spread

#run the application:

echo ' '
echo 'Running jacobi.f90 with 125 MPI tasks and' $OMP_NUM_THREADS 'OMP threads'

time srun -n 125 -c 1 --cpu_bind=cores /global/homes/s/sbadman/astro_250/homework2/badman_hw2/jacobi

echo ' '
echo 'Running jacobi.f90 with 100 MPI tasks and' $OMP_NUM_THREADS 'OMP threads'

time srun -n 100 -c 1 --cpu_bind=cores /global/homes/s/sbadman/astro_250/homework2/badman_hw2/jacobi

export OMP_NUM_THREADS=2

echo ' '

echo 'Running jacobi.f90 with 40 MPI tasks and' $OMP_NUM_THREADS 'OMP threads'

time srun -n 40 -c 2 --cpu_bind=cores /global/homes/s/sbadman/astro_250/homework2/badman_hw2/jacobi

echo ' '

export OMP_NUM_THREADS=6

echo 'Running jacobi.f90 with 20 MPI tasks and' $OMP_NUM_THREADS 'OMP threads'

time srun -n 20 -c 6 --cpu_bind=cores /global/homes/s/sbadman/astro_250/homework2/badman_hw2/jacobi

echo ' '

export OMP_NUM_THREADS=12

echo 'Running jacobi.f90 with 10 MPI tasks and' $OMP_NUM_THREADS 'OMP threads'

time srun -n 10 -c 12 --cpu_bind=cores /global/homes/s/sbadman/astro_250/homework2/badman_hw2/jacobi

echo ' '

export OMP_NUM_THREADS=16

echo 'Running jacobi.f90 with 8 MPI tasks and' $OMP_NUM_THREADS 'OMP threads'

time srun -n 8 -c 16 --cpu_bind=cores /global/homes/s/sbadman/astro_250/homework2/badman_hw2/jacobi

echo ' '

export OMP_NUM_THREADS=64

echo 'Running jacobi.f90 with 2  MPI tasks and' $OMP_NUM_THREADS 'OMP threads'

time srun -n 2 -c 64 --cpu_bind=cores /global/homes/s/sbadman/astro_250/homework2/badman_hw2/jacobi
