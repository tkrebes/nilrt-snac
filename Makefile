# SPDX-License-Identifier: BSD-3-Clause

.DEFAULT_GOAL := all

.PHONY : all install uninstall
SHELL = /bin/sh

## VARIABLES

project = nilrt-snac

# GNU directories
prefix ?= /usr/local
exec_prefix ?= $(prefix)
bindir ?= $(exec_prefix)/bin

datarootdir ?= $(prefix)/share

datadir ?= $(datarootdir)
docdir ?= $(datarootdir)/doc/$(project)
libdir ?= $(exec_prefix)/lib/$(project)
sbindir ?= $(exec_prefix)/sbin

SRC_FILES = \
	src/configure-nilrt-snac \
	src/nilrt-snac \
	src/util.sh \


## PHONY TARGETS

all :
	echo $(srcdir)
	@echo "Nothing to build. All source files are architecture-independent."


install : $(SRC_FILES) LICENSE README.md
	mkdir -p $(DESTDIR)$(sbindir)
	install -o 0 -g 0 --mode=0755 -t "$(DESTDIR)$(sbindir)" \
		src/nilrt-snac

	mkdir -p $(DESTDIR)$(libdir)
	install --mode=0444 -t "$(DESTDIR)$(libdir)" \
		src/configure-nilrt-snac \
		src/util.sh \

	mkdir -p $(DESTDIR)$(docdir)
	install --mode=0444 -t "$(DESTDIR)$(docdir)" \
		LICENSE \
		README.md


uninstall :
	rm -vf $(DESTDIR)$(sbindir)/nilrt-snac
	rm -rvf $(DESTDIR)$(libdir)
	rm -rvf $(DESTDIR)$(docdir)
