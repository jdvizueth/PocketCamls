.PHONY: test check

build:
	dune build

code:
	-dune build
	code .
	! dune build --watch

utop:
	OCAMLRUNPARAM=b dune utop src

test:
	OCAMLRUNPARAM=b dune exec bin/test/main.exe

play:
	OCAMLRUNPARAM=b dune exec bin/main.exe

zip:
	rm -f pocketcaml.zip
	zip -r pocketcaml.zip . -x@exclude.lst

clean:
	dune clean
	rm -f pocketcaml.zip

doc:
	dune build @doc

opendoc: doc
	@bash opendoc.sh
