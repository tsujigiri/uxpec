UXNASM ?= uxnasm
UXNEMU ?= uxnemu
UXNCLI ?= uxncli
UXN_ROMS ?= ${HOME}/roms
DEBUGGER ?= ${UXN_ROMS}/beetbug.rom
DEBUG_TARGET ?= bin/uxpec_test.rom

SHELL = /bin/bash
.SUFFIXES:
.SUFFIXES: .tal .rom

demo: bin/demo.rom
	-${UXNCLI} $^

debug: ${DEBUG_TARGET}
	${UXNEMU} ${DEBUGGER} ${DEBUG_TARGET}

test: bin/uxpec_test.rom
	${UXNCLI} $^

watch:
	while inotifywait -r -e modify .; do make test; done

bin/uxpec_test.rom: src/uxpec.tal test/*.tal
	${UXNASM} test/uxpec_test.tal $@

bin/demo.rom: etc/demo.tal src/uxpec.tal
	${UXNASM} etc/demo.tal $@

.PHONY: demo debug test watch
