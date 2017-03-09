#!/bin/bash


#SBATCH --job-name=midpoint_hybrid
#SBATCH --nodes=2
#SBATCH --time=00:20:00
#SBATCH --partition=debug
#SBATCH --license=SCRATCH
#SBATCH --account=m2218
#SBATCH --constraint=haswell
#SBATCH --output=jgroh_hw2.out

# extreme setting where it's mostly openMP
N=2
C=64
echo "-----------------------------------------------"
echo "Run 1"
echo "Number of MPI tasks: $N"
echo "Number of OpenMP threads per MPI task: $C"
export OMP_NUM_THREADS=$C
export OMP_PLACES=threads
export OMP_PROC_BIND=spread
time srun -n $N -c $C --cpu_bind=cores /global/homes/j/jgroh/homework/homework2/groh_hw2/midpoint
echo " "
echo " "

# an intermediate option
N=4
C=32
echo "-----------------------------------------------"
echo "Run 2"
echo "Number of MPI tasks: $N"
echo "Number of OpenMP threads per MPI task: $C"
export OMP_NUM_THREADS=$C
export OMP_PLACES=threads
export OMP_PROC_BIND=spread
time srun -n $N -c $C --cpu_bind=cores /global/homes/j/jgroh/homework/homework2/groh_hw2/midpoint
echo " "
echo " "

# another intermediate option
N=8
C=16
echo "-----------------------------------------------"
echo "Run 3"
echo "Number of MPI tasks: $N"
echo "Number of OpenMP threads per MPI task: $C"
export OMP_NUM_THREADS=$C
export OMP_PLACES=threads
export OMP_PROC_BIND=spread
time srun -n $N -c $C --cpu_bind=cores /global/homes/j/jgroh/homework/homework2/groh_hw2/midpoint
echo " "
echo " "

# another intermediate option
N=16
C=8
echo "-----------------------------------------------"
echo "Run 4"
echo "Number of MPI tasks: $N"
echo "Number of OpenMP threads per MPI task: $C"
export OMP_NUM_THREADS=$C
export OMP_PLACES=threads
export OMP_PROC_BIND=spread
time srun -n $N -c $C --cpu_bind=cores /global/homes/j/jgroh/homework/homework2/groh_hw2/midpoint
echo " "
echo " "

# another intermediate option
N=32
C=4
echo "-----------------------------------------------"
echo "Run 5"
echo "Number of MPI tasks: $N"
echo "Number of OpenMP threads per MPI task: $C"
export OMP_NUM_THREADS=$C
export OMP_PLACES=threads
export OMP_PROC_BIND=spread
time srun -n $N -c $C --cpu_bind=cores /global/homes/j/jgroh/homework/homework2/groh_hw2/midpoint
echo " "
echo " "


# other extreme setting where it's mostly MPI
N=64
C=2
echo "-----------------------------------------------"
echo "Run 6"
echo "Number of MPI tasks: $N"
echo "Number of OpenMP threads per MPI task: $C"
export OMP_NUM_THREADS=$C
time srun -n $N -c $C --cpu_bind=cores /global/homes/j/jgroh/homework/homework2/groh_hw2/midpoint
echo " "
echo " "



