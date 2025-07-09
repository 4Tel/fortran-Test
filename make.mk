.SUFFIXES : 
.SUFFIXES : .f90 .o .x
.f90.o: 
	$(MPIF90) $(F90FLAGS) -c $<
.o.x:
	$(LD) $(LDFLAGS) -o $@ $< $(LIB_OBJS) $(LD_LIBS)

LIB_DIR     = ../../lib
LIB_OBJS    = $(patsubst %.f90,%.o,$(wildcard $(LIB_DIR)/*.f90))

MOD_FLAG		= -I
MODFLAGS    = $(MOD_FLAG). $(MOD_FLAG)$(LIB_DIR)

MPIF90      = mpiifort
F90FLAGS    = $(FFLAGS) -nomodule -fpp -allow nofpp_comments -qopenmp $(MODFLAGS)
FFLAGS      = -O2 -g -traceback -no-wrap-margin

LD          = mpiifort
LDFLAGS     = -qopenmp
LD_LIBS     = 

AR          = ar
ARFLAGS     = ruv

RANLIB      = ranlib

files := $(patsubst %.f90,%.o,$(wildcard *.f90))

default:all
all: build
build: $(files) $(exes)
run: 
	- mpirun -np 4 ./main.x
clean:
	- /bin/rm -f *.x *.o *.a *.mod *.i90
