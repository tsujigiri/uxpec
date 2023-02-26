UXNASM ?= uxnasm
UXNEMU ?= uxnemu
UXNCLI ?= uxncli
UXN_ROMS ?= ${HOME}/roms
DEBUGGER ?= ${UXN_ROMS}/beetbug.rom

SHELL = /bin/bash
.SUFFIXES:
.SUFFIXES: .tal .rom

demo: bin/demo.rom
	-${UXNCLI} $^

debug: bin/demo.rom
	${UXNEMU} ${DEBUGGER} bin/demo.rom

bin/demo.rom: etc/demo.tal src/uxpec.tal
	uxnasm etc/demo.tal $@

.PHONY: demo debug
