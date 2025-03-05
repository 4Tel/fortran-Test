include ../make.inc
files=main.o

default:all
all: main.x
main.x: $(files)
	$(LD) $(LDFLAGS) -o $@ $(files)
clean:
	- /bin/rm -f *.x *.o *.a *.mod *.i90
