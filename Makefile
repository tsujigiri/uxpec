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

bin/demo.rom: etc/demo.tal src/uxpec.tal
	rm -rf tmp
	mkdir -p bin tmp
	cat $^ > tmp/build.tal
	uxnasm tmp/build.tal $@

debug: bin/demo.rom
	${UXNEMU} ${UXN_ROMS}/beetbug.rom bin/demo.rom

