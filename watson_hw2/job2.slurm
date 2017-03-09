#!/bin/bash
#SBATCH -N 2
#SBATCH -C haswell
#SBATCH -p debug
#SBATCH -J jacobi
#SBATCH --mail-user=watson_james@berkeley.edu
#SBATCH -t 00:30:00

#OpenMP settings:
#export OMP_PLACES=threads
#export OMP_PROC_BIND=spread


#run the application:
export OMP_NUM_THREADS=1
echo "------------------------">>debug_debug_hw2.out
echo "pure MPI, 50 MPI per node, OMP_NUM_THREAD=1"
echo "pure MPI, 50 MPI per node, OMP_NUM_THREAD=1">debug_hw2.out
echo "time srun -n 100  ./jacobi > debug_hw2.out"
time srun -n 100 -c 1 ./jacobi >> debug_hw2.out


#run the application:
export OMP_NUM_THREADS=2
echo "------------------------">>debug_hw2.out
echo "hybrid  OMP/MPI, 25 MPI per node, OMP_NUM_THREAD=2"
echo "hybrid  OMP/MPI, 25 MPI per node, OMP_NUM_THREAD=2">>debug_hw2.out
echo "time srun -n 50 -c 2  ./jacobi > debug_hw2.out"
time srun -n 50 -c 2 ./jacobi >> debug_hw2.out


#run the application:
export OMP_NUM_THREADS=4
echo "------------------------">>debug_hw2.out
echo "hybrid OMP/ MPI, 20 MPI per node, OMP_NUM_THREAD=4"
echo "hybrid OMP/ MPI, 20 MPI per node, OMP_NUM_THREAD=4">>debug_hw2.out
echo "time srun -n 40 -c 3  ./jacobi > debug_hw2.out"
time srun -n 40 -c 3 ./jacobi >> debug_hw2.out





#run the application:
export OMP_NUM_THREADS=8
echo "------------------------">>debug_hw2.out
echo "hybrid OMP/ MPI, 8 MPI per node, OMP_NUM_THREAD=8"
echo "hybrid OMP/ MPI, 8 MPI per node, OMP_NUM_THREAD=8">>debug_hw2.out
echo "time srun -n 16 -c 8  ./jacobi > debug_hw2.out"
time srun -n 16 -c 8 ./jacobi >> debug_hw2.out


#run the application:
export OMP_NUM_THREADS=32
echo "------------------------">>debug_hw2.out
echo "hybrid OMP/ MPI, 4 MPI per node, OMP_NUM_THREAD=32"
echo "hybrid OMP/ MPI, 4 MPI per node, OMP_NUM_THREAD=32">>debug_hw2.out
echo "time srun -n 8 -c 16  ./jacobi > debug_hw2.out"
time srun -n 8 -c 16 ./jacobi >> debug_hw2.out



#run the application:
export OMP_NUM_THREADS=64
export OMP_PROC_BIND=true
export OMP_PLACES=threads
echo "------------------------">>debug_hw2.out
echo "pure OMP, 1 MPI per node, OMP_NUM_THREAD=64"
echo "pure OMP, 1 MPI per node, OMP_NUM_THREAD=64">>debug_hw2.out
echo "time srun -n 2 -c 64  ./jacobi > debug_hw2.out"
time srun -n 2 -c 64 ./jacobi >> debug_hw2.out
