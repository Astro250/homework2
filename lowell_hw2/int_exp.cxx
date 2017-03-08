#include "mpi.h"
#include <iostream>
#include <cmath>
#include <stdio.h>
using namespace std;


int main(int argc,char ** argv){
	
	double x0 = 0.0;
	double x1 = 1.0;
	unsigned long long int n = 82500000000;
	double dx = (x1 - x0)/((double) n);
	double r = 0.0;
	int numprocs, my_rank;
	unsigned long long int j = 0;


	MPI_Init(&argc,&argv);
	MPI_Comm_size(MPI_COMM_WORLD, &numprocs);
	MPI_Comm_rank(MPI_COMM_WORLD, &my_rank);

	unsigned long long int chunk_size = n/numprocs;
	unsigned long long int remainder = n - (numprocs*chunk_size);

	unsigned long long int istart = my_rank*chunk_size;
	unsigned long long int imax = istart + chunk_size;
	if(my_rank == (numprocs - 1)) imax += remainder;
	unsigned long long int i;

	#pragma omp parallel for reduction(+:r)
	for(i = istart; i < imax; ++i){
		double x = ((double) i) * dx;
		r += dx*exp(-x)*exp(-3.*x)*exp(-4.*x)*exp(-5.*x);
	}

	//mpi_send r back to rank 0 which will add up all the r's and prunsigned long long int them out
	double rs = 0.0;
	MPI_Status status;

	if(my_rank == 0){
		//mpi_recv
		for(j = 1; j < numprocs; ++j){
			if(MPI_Recv((void*)&rs, 1, MPI::DOUBLE, j, j, MPI_COMM_WORLD, &status) != MPI_SUCCESS){
				std::cout << "MPI_Recv failed for rank " << j << endl;
			} else {
				//std::cout << "received sub integral = " << rs << " from rank " << j << endl;
				r += rs;
			}

		}
		//std::cout << "total unsigned long long integral = " << r << endl;
		printf("total integral = %.15e\n",r);
	} else {
		//mpi_send
		if(MPI_Send((void*)&r, 1, MPI::DOUBLE, 0, my_rank, MPI_COMM_WORLD) != MPI_SUCCESS){
			std::cout << "MPI_Send failed for rank " << my_rank << endl;
		}
	}


	MPI_Finalize();
	return 0;
}
			

	




