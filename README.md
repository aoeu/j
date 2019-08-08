must
====

`must` is a handy way to run project-specific commands.

`must` looks upward from the current directory for a file called "mustfile" and then runs make with that file as the makefile. must also sets the current working directory to where it found the mustfile, so your commands are executed from the root of your project and not from whatever subdirectory you happen to be in.

With no arguments it runs the default recipe:

`must`

Adding one argument specifies the recipe:

`must compile`

Arguments after '--' are exported as ARG0, ARG1, ... ARGN, which can be used in the mustfile. To run recipe "compile" and export ARG0=bar and ARG1=baz:

`must compile -- bar baz`

You might want to alias `must` to `m`, so that it's even easier to run.

By way of example, the included mustfile has a pinch of fanciful fluff.


getting must
------------

`must` is a self-contained shell script that only depends on make and bash. You can download it from github and put it wherever you put your scripts.

history
-------
`must` is a renamed (and possibly the only surviving fork) of a previous incarnation of [just](github.com/casey/just).
As observable from the `git` commit history of `must`, `just` was once a shell-script wrapper for `make`. Later, `just` was rewritten (from scratch) as a stand-alone Rust program that supports many languages for use in `make`-influenced recipes. 

`must` is a result (more precisely, a rename, and resurrection of `just`) from the maintainer working heavily in a monolithic repository where the `Makefile` was already in use, committed in VCS, and broken, all while simultaneously dealing with a (maintainer-imposed) bug in modern `just` where every recipe of the `justfile` was executing as root (somehow) and leading to mostly-harmless havoc. So, an old fork of the previous incarnation of `just` was resurreceted and renamed as `must` (using `mustfile`s) with the `m` in `must` being a head-nod to `just`s original roots as a `make` wrapper, the name `must` also being a reference compulsory tendencies while computing, and lastly (and most critically) as something to fallback on in the mono-repo while trying to fix the Makefile, debug `just` / the justfile, and just make all the things work.
