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
