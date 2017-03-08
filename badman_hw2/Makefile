include make.inc

SRC = jacobi.f90 
OBJ = jacobi.o

all:
	$(MAKE) jacobi

# generic compilation 
.f90.o:
	$(F90) $(OFLAGS)  -c $<

test : $(TEST)
	$(F90) $(OFLAGS) -o jacobi $(TEST) $(LIB)

clean:
	rm -f  jacobi *~ core a.out *.mod *.o

