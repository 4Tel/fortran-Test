.SUFFIXES : 
.SUFFIXES : .o .mod .f90
.f90.o:
	$(MPIF90) $(F90FLAGS) -c $<

IFLAGS         = -I.
MODFLAGS       = -module ../../lib

MPIF90         = mpiifort
F90FLAGS       = $(FFLAGS) -nomodule -fpp -allow nofpp_comments -qopenmp $(IFLAGS) $(MODFLAGS)
FFLAGS         = -O2 -g -traceback -no-wrap-margin

LD             = mpiifort
LDFLAGS        = -qopenmp
LD_LIBS        = 

AR             = ar
ARFLAGS        = ruv

RANLIB         = ranlib

