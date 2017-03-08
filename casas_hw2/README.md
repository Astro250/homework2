# homework2
Juan Camilo Buitrago-Casas

One of the easiest way to change the running time is by changing the number of iterations "maxiter" (default 1000, line 116) or the gride size "ngrid" (default 10000, 115).

I used job01.sl to run jacobi as a pure MPI on only one node, setting maxiter=2300 and leaving ngrids with it's default value to get a running time of 4m58.887s. Then I changed the number of nodes and ran the program as a pure MPI. I observed how decreased reaching a minimum time of 0m36.114s for 16 nodes. 

Then, I ran jacobi as a pure OpenMP for a different number of threads. I found that increasing the number of threads while keeping constat the number of cores doesn't help to improve the speed of the program. At the end I ran five hybrid configuartions that ratify this claim.


----------------------------------------------------------------------------------------
Time		|Parallel-mode	|Nodes	|Threads	|Script	     |	Output 	
----------------------------------------------------------------------------------------
4m58.887s	 Pure MPI	 2	 1		 job01.sl	job01.out
2m29.097s	 Pure MPI	 4	 1		 job02.sl	job02.out
1m17.383s	 Pure MPI	 8	 1		 job03.sl	job03.out
0m36.114s	 Pure MPI	 16	 1		 job04.sl	job04.out
ERROR		 Pure MPI	 32	 1		 job05.sl	job05.out

1m7.442s	 Pure OpenMP	 1	 2		 job06.sl	job06.out
1m28.811s	 Pure OpenMP	 1	 4		 job07.sl	job07.out
2m28.171s	 Pure OpenMP	 1	 8		 job08.sl	job08.out
4m48.448s	 Pure OpenMP	 1	 16		 job09.sl	job09.out
9m35.500s	 Pure OpenMP	 1	 32		 job10.sl	job10.out

0m47.854s	 Hybrid		 2	 2		 job11.sl	job11.out
1m16.927s	 Hybrid		 2	 4		 job12.sl	job12.out
2m25.443s	 Hybrid		 2	 8		 job13.sl	job13.out
4m50.900s	 Hybrid		 2	 16		 job14.sl	job14.out
9m28.835s	 Hybrid		 2	 32		 job15.sl	job15.out
-----------------------------------------------------------------------------------------













