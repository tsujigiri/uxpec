UXNASM ?= uxnasm
UXNEMU ?= uxnemu
UXNCLI ?= uxncli
UXN_ROMS ?= ../bin
DEBUGGER ?= ${UXN_ROMS}/beetbug.rom

SHELL = /bin/bash
.SUFFIXES:
.SUFFIXES: .tal .rom

demo: bin/demo.rom
	-${UXNCLI} $^

debug: bin/demo.rom
	${UXNEMU} ${UXN_ROMS}/beetbug.rom bin/demo.rom

bin/demo.rom: tmp etc/demo.tal src/uxpec.tal
	cat etc/demo.tal src/uxpec.tal > tmp/build.tal
	uxnasm tmp/build.tal $@

tmp:
	mkdir tmp

.PHONY: demo debug
