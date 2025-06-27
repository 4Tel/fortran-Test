include ../make.mk

libs := $(patsubst %.f90,%.o,$(wildcard *.f90))

default: all
all: build
build: $(libs)
test:
	@echo ${libs}
clean:
	- /bin/rm -f *.x *.o *.a *.mod *.i90
