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
echo "------------------------">>hw2.out
echo "pure MPI, 50 MPI per node, OMP_NUM_THREAD=1"
echo "pure MPI, 50 MPI per node, OMP_NUM_THREAD=1">hw2.out
echo "time srun -n 100  ./jacobi > hw2.out"
time srun -n 100 -c 1 ./jacobi >> hw2.out


#run the application:
export OMP_NUM_THREADS=2
echo "------------------------">>hw2.out
echo "hybrid  OMP/MPI, 25 MPI per node, OMP_NUM_THREAD=2"
echo "hybrid  OMP/MPI, 25 MPI per node, OMP_NUM_THREAD=2">>hw2.out
echo "time srun -n 50 -c 2  ./jacobi > hw2.out"
time srun -n 50 -c 2 ./jacobi >> hw2.out


#run the application:
export OMP_NUM_THREADS=4
echo "------------------------">>hw2.out
echo "hybrid OMP/ MPI, 20 MPI per node, OMP_NUM_THREAD=4"
echo "hybrid OMP/ MPI, 20 MPI per node, OMP_NUM_THREAD=4">>hw2.out
echo "time srun -n 40 -c 3  ./jacobi > hw2.out"
time srun -n 40 -c 3 ./jacobi >> hw2.out





#run the application:
export OMP_NUM_THREADS=8
echo "------------------------">>hw2.out
echo "hybrid OMP/ MPI, 8 MPI per node, OMP_NUM_THREAD=8"
echo "hybrid OMP/ MPI, 8 MPI per node, OMP_NUM_THREAD=8">>hw2.out
echo "time srun -n 16 -c 8  ./jacobi > hw2.out"
time srun -n 16 -c 8 ./jacobi >> hw2.out


#run the application:
export OMP_NUM_THREADS=32
echo "------------------------">>hw2.out
echo "hybrid OMP/ MPI, 4 MPI per node, OMP_NUM_THREAD=32"
echo "hybrid OMP/ MPI, 4 MPI per node, OMP_NUM_THREAD=32">>hw2.out
echo "time srun -n 8 -c 16  ./jacobi > hw2.out"
time srun -n 8 -c 16 ./jacobi >> hw2.out



#run the application:
export OMP_NUM_THREADS=64
export OMP_PROC_BIND=true
export OMP_PLACES=threads
echo "------------------------">>hw2.out
echo "pure OMP, 1 MPI per node, OMP_NUM_THREAD=64"
echo "pure OMP, 1 MPI per node, OMP_NUM_THREAD=64">>hw2.out
echo "time srun -n 2 -c 64  ./jacobi > hw2.out"
time srun -n 2 -c 64 ./jacobi >> hw2.out
