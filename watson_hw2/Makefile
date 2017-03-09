include make.inc

TEST = jacobi.o

all:
	$(MAKE) jacobi

# generic compilation 
.f.o:
	$(F90) $(OFLAGS)  -c $<

jacobi.o : jacobi.f90
	$(F90) $(OFLAGS) -c jacobi.f90

jacobi : $(TEST)
	$(F90) $(OFLAGS) -o jacobi $(TEST) $(IPM)

clean:
	rm -f  jacobi  *.o

