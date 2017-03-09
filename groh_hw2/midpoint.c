/*
 * Homework 2
 * John Groh
 */
#include <mpi.h>
#include <math.h>
#include <omp.h>
#include <stdio.h>

// the function we'll integrate
float fct(float x) {
  return cos(x);
}

// integrates the function fct (defined above) starting at a, with n steps of length h
float integral(float a, int n, float h);

int main(int argc, char** argv) {

  int n = pow(2,30); // number of sample points (all processes)
  int i; // loop index to loop over MPI processes

  float result; // result of integral
  float a = 0; // lower limit of integrationm
  float b = acos(-1.0) / 2.; // upper limit of interation: pi/2
  float h = (b-a)/n; // step size

  int source; // for MPI send and recv calls later
  int dest = 0; // the process that computes the final result
  int tag = 123; // random int to identify this job
  MPI_Status status; // likewise


  // Start MPI and get the current process ID and number of processes
  MPI_Init(&argc, &argv);
  int pid; // process id
  MPI_Comm_rank(MPI_COMM_WORLD, &pid);
  int n_procs; // number of MPI processes
  MPI_Comm_size(MPI_COMM_WORLD, &n_procs);


  int my_n = n/n_procs; // number of sample points per MPI process
  float my_range = (b-a)/n_procs; // how far to move out from my_a when integrating
  float my_a = a + pid*my_range; // lower limit of integration for this process
  float my_result = integral(my_a, my_n, h);

  // if this is the master process, do the final addition and print the result
  // otherwise, send the result to the master process
  if (pid == 0) {
    result = my_result;
    for (i=1; i<n_procs; i++) {
      source = i; // MPI process indexing starts at 0
      MPI_Recv(&my_result, 1, MPI_REAL, source, tag, MPI_COMM_WORLD, &status);
      result += my_result;
    }
    printf("Result of integration: %f\n",result);
  }
  else {
    MPI_Send(&my_result, 1, MPI_REAL, dest, tag, MPI_COMM_WORLD);
  }

  MPI_Finalize();
  return 0;
}

// integrates the function fct (defined above) starting at a, with n steps of length h
// aaaaaand since things are running too quickly, add some senseless operations to slow it
// these still aren't making any noticeable slowdown...?
float integral(float a, int n, float h) {

  float interval_edge;
  float result = 0.0;
  float h_over_2 = h/2.; // I guess this saves some flops?
  int j;

  // parallelize loop properly with openmp
#pragma omp parallel for reduction(+:result)
  for (j=0; j<n; j++) {
    result += fct(a + j*h + h_over_2) * h;
   
    /* Not sure why, but even this doesn't seem to slow stuff down
     * int q, s, t, r, w, z, d;
     * int largenum = pow(2, 30);
     * double stupid;
     * for (q=0; q<largenum; q++) {
     *   for (s=0; s<largenum; s++) {
     *	for (t=0; t<largenum; t++) {
     *	  for (r=0; r<largenum; r++) {
     *	    for (w=0; w<largenum; w++) {
     *	      for (z=0; z<largenum; z++) {
     *		for (d=0; d<largenum; d++) {
     *		  stupid = pow(stupid, acos(-1.0));
     *		  stupid += 0.000000001;
     *		  stupid = pow(stupid, 1. / acos(-1.0));
     *		  stupid -= 0.0000000001;
     *		  stupid = pow(stupid, acos(-1.0));
     *		  stupid += 0.000000001;
     *		  stupid = pow(stupid, 1. / acos(-1.0));
     *		  stupid -= 0.0000000001;
     *		}
     *	      }
     *	    }
     *	  }
     *	}
     *}
     *}  
     */
  }
  return result;
}
