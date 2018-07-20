.PHONY: clean distclean test build check-symbols

DCC ?= dmd

clean:
	rm -rf build/*
distclean:
	rm -rf build/* .dub
testbin: dub.json $(wildcard source/* test/*)
	dub build -b unittest -c unittest -v --compiler=${DCC}

build: dub.json $(wildcard source/*)
	dub build -v --compiler=${DCC}

test: testbin
	./build/test

check-symbols: build
	./check-no-und-symbols.sh
