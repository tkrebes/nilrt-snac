# SPDX-License-Identifier: BSD-3-Clause

.DEFAULT_GOAL := all

.PHONY : all install uninstall


## VARIABLES

# GNU directories
prefix ?= /usr/local
exec_prefix ?= $(prefix)
bindir ?= $(exec_prefix)/bin

datadir ?= $(datarootdir)
datarootidr ?= $(prefix)/share
libdir ?= $(exec_prefix)/lib
sbindir ?= $(exec_prefix)/sbin

SRC_FILES = \
	src/configure-nilrt-snac \


## PHONY TARGETS

all :
	@echo "Nothing to build. All source files are architecture-independent."

install : $(SRC_FILES)
	mkdir -p $(sbindir)
	install -o 0 -g 0 --mode=0755 src/configure-nilrt-snac $(sbindir)

uninstall :
	rm -v $(sbindir)/configure-nilrt-snac
