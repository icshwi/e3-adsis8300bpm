TOP = ../../..
include $(TOP)/configure/CONFIG
# ARCH = linux-x86_64
TARGETS = envPaths
include $(TOP)/configure/RULES.ioc

# BDE
# install the IOC envPaths, request, setup and init files into $(INSTALL_LOCATION)/iocBoot/startup
DESTDIR := $(INSTALL_LOCATION)/iocBoot/startup
FILES := envPaths $(wildcard *.req) $(wildcard *.cmd) $(wildcard *.setup) $(wildcard *.init)
# $(warning FILES = $(FILES))

install: $(FILES) $(DESTDIR)
	$(INSTALL) -d -m 0444 $(FILES) $(DESTDIR)
$(DESTDIR):
	$(MKDIR) -p $@
# BDE
