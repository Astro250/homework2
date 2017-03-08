#!/bin/bash -l
#SBATCH -N 1					#Use 1 Nodes
#SBATCH -C haswell 				#Use Haswell Nodes
#SBATCH -p debug				#Submit to the debug 'partition'
#SBATCH -J jacobi_first_test			#Job Name
#SBATCH --mail-user=juan@berkeley.edu		#My email
#SBATCH -t 00:30:00				#Set 30 min time limit
#SBATCH -o job06.out                            #Name output

#OpenMP settings:
export OMP_NUM_THREADS=2
export OMP_PLACES=threads
export OMP_PROC_BIND=spread


#run the application:
time srun -n 16 -c 2 --cpu_bind=cores ./jacobi
