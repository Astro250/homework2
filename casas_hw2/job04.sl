#!/bin/bash -l
#SBATCH -N 16					#Use 16 Nodes
#SBATCH -C haswell 				#Use Haswell Nodes
#SBATCH -p debug				#Submit to the debug 'partition'
#SBATCH -J jacobi_first_test			#Job Name
#SBATCH --mail-user=juan@berkeley.edu		#My email
#SBATCH -t 00:30:00				#Set 30 min time limit
#SBATCH -o job04.out                            #Name output

#OpenMP settings:
export OMP_NUM_THREADS=1
export OMP_PLACES=threads
export OMP_PROC_BIND=spread


#run the application:
time srun -n 16 -c 32 --cpu_bind=cores ./jacobi
