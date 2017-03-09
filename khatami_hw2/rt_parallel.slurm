#!/bin/bash
#SBATCH -N 2
#SBATCH -C haswell
#SBATCH -p debug
#SBATCH -J rt_mpi1_omp64
#SBATCH -t 00:30:00

#OpenMP settings:
export OMP_NUM_THREADS=64
export OMP_PLACES=threads
export OMP_PROC_BIND=spread

cd $SCRATCH/rt_test/test_mpi1_omp64

#run the application:
srun -n 2 -c $OMP_NUM_THREADS --cpu_bind=threads /global/cscratch1/sd/dkhatami/rt_test/Castro2d.gnu.PROF.MPI.OMP.ex /global/cscratch1/sd/dkhatami/rt_test/inputs_2d
