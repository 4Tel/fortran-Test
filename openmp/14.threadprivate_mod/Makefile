exes= \
	main.x
include ../../make.mk

LIB_OBJS=mod.o

mod.o: mod.f90
	$(MPIF90) $(FFLAGS) -c $<
main.x: main.f90 my_mod.mod