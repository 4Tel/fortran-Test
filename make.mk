.SUFFIXES : 
.SUFFIXES : .o .f90
.f90.o:
	$(MPIF90) $(F90FLAGS) -c $<

MOD_FLAG		= -I
MODFLAGS    = $(MOD_FLAG). $(MOD_FLAG)../../lib

MPIF90      = mpiifort
F90FLAGS    = $(FFLAGS) -nomodule -fpp -allow nofpp_comments -qopenmp $(MODFLAGS)
FFLAGS      = -O2 -g -traceback -no-wrap-margin

LD          = mpiifort
LDFLAGS     = -qopenmp
LD_LIBS     = 

AR          = ar
ARFLAGS     = ruv

RANLIB      = ranlib

