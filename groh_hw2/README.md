# homework2
Due Friday March 3rd

Files:
midpoint.c - the code I'm parallizing and profiling
run_midpoint.sh - my submission script
jgroh_hw2.out - the output from said submission script
compile.sh - for people like me who always forget the correct flag(s)
check_status_obsessively.py - calls "squeue -u username" in a loop

Notes:
I've been stopped by the barrier of the numerical integration code running too fast.  Throwing extra nested loops of exponentiation, etc don't seem to make a dent at all.

Call me a bad student, but I think I get the point and am not all that excited to spend a bunch of time just trying to make code slower...

Results:
I think my code run time is dominated by overhead.  There doesn't seem to be an obvious trend with the MPI/OpenMP division as of now.