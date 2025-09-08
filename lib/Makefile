ifeq ($(wildcard depend.mk),)
depend.mk: $(LIB_OBJS)
	@$(call color_echo, "Generating depend.mk ...")
	- (makedepf90 *.f90 > depend.mk) 2> /dev/null || rm -f depend.mk
endif

include ../make.mk
default: depend.mk all

ifneq ($(wildcard depend.mk),)
include depend.mk
else
endif
