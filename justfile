# just a makefile with no special magic

# run the create and compile recipes by default
default: create compile

# create our quine
create:
	mkdir -p tmp
	echo 'int printf(const char*, ...); int main() { char *s = "int printf(const char*, ...); int main() { char *s = %c%s%c; printf(s, 34, s, 34); return 0; }"; printf(s, 34, s, 34); return 0; }' > tmp/gen0.c

# make sure it's really a quine
compile:
	cc tmp/gen0.c -o tmp/gen0
	./tmp/gen0 > tmp/gen1.c
	cc tmp/gen1.c -o tmp/gen1
	./tmp/gen1 > tmp/gen2.c
	diff tmp/gen1.c tmp/gen2.c
	@echo 'It was a quine!'

# clean up
clean:
	rm -r tmp

# demonstrate the use of positional arguments
args:
	@echo "I got some arguments: ARG0=$$ARG0 ARG1=$$ARG1 ARG2=$$ARG2"

# put symlinks to just into ~/bin
install:
	ln -s $$PWD/just ~/bin/just
	ln -s $$PWD/just ~/bin/j

uninstall:
	if test -L ~/bin/j ; then \
		READLINK=`readlink ~/bin/j` ; \
		if test $$READLINK = $$PWD/just ; then unlink ~/bin/j ; fi ; \
	fi
	if test -L ~/bin/just ; then \
		READLINK=`readlink ~/bin/just` ; \
		if test $$READLINK = $$PWD/just ; then unlink ~/bin/just ; fi ; \
	fi
