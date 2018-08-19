build:
	dune build

test: build
	dune runtest

all: build

install:
	dune install

uninstall:
	dune uninstall

clean:
	dune clean

.PHONY: build test all install uninstall clean
