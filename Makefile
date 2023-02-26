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

bin/demo.rom: etc/demo.tal src/uxpec.tal
	uxnasm etc/demo.tal $@

.PHONY: demo debug
