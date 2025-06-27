include ../../make.mk
files= \
	main.o \
	../../lib/*.o


default: all
all: main.x
main.x: $(files)
	$(LD) $(LDFLAGS) -o $@ $(files)
run:
	- mpirun -np 4 ./main.x
clean:
	- /bin/rm -f *.x *.o *.a *.mod *.i90
