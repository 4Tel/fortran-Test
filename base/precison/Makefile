include ../../make.mk
files= \
	main.o \
	../../lib/clock.o


default: all
all: main.x
main.x: $(files)
	$(LD) $(LDFLAGS) -o $@ $(files)
../../lib/clock.o ../../lib/clock.mod: ../../lib/clock.f90
		$(FC) $(FFLAGS) -c $< -o ../../lib/clock.o
clean:
	- /bin/rm -f *.x *.o *.a *.mod *.i90
