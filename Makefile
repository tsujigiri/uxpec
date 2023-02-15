demo:
	rm -r tmp
	mkdir -p bin tmp
	rm -f bin/uxspec_demo.rom
	cat etc/demo.tal src/assert.tal src/print.tal > tmp/build.tal
	uxnasm tmp/build.tal bin/uxpec_demo.rom
	uxncli bin/uxpec_demo.rom

