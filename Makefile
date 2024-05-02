# SPDX-License-Identifier: BSD-3-Clause

.DEFAULT_GOAL := all

.PHONY : all install uninstall


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


## PHONY TARGETS

all :
	@echo "Nothing to build. All source files are architecture-independent."


install : $(SRC_FILES) LICENSE README.md
	mkdir -p $(sbindir)
	install -o 0 -g 0 --mode=0755 src/configure-nilrt-snac $(sbindir)

	mkdir -p $(docdir)
	install --mode=0444 -t "$(docdir)" \
		LICENSE \
		README.md


uninstall :
	rm -vf $(sbindir)/configure-nilrt-snac
	rm -rvf $(docdir)
