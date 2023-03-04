UXNASM ?= uxnasm
UXNEMU ?= uxnemu
UXNCLI ?= uxncli
UXN_ROMS ?= ${HOME}/roms
DEBUGGER ?= ${UXN_ROMS}/beetbug.rom
DEBUG_TARGET ?= bin/demo.rom

SHELL = /bin/bash
.SUFFIXES:
.SUFFIXES: .tal .rom

demo: bin/demo.rom
	-${UXNCLI} $^

debug: ${DEBUG_TARGET}
	${UXNEMU} ${DEBUGGER} ${DEBUG_TARGET}

test: bin/uxpec_test.rom
	${UXNCLI} $^

bin/uxpec_test.rom: src/uxpec.tal test/uxpec_test.tal test/assert_test.tal test/describe_context_it_test.tal
	${UXNASM} test/uxpec_test.tal $@

bin/demo.rom: etc/demo.tal src/uxpec.tal
	${UXNASM} etc/demo.tal $@

.PHONY: demo debug test
