just
====

just is a handy way to run project-specific commands.

just looks upward from the current directory for a file called "justfile" and then runs make with that file as the makefile. just also sets the current working directory to where it found the justfile, so your commands are executed from the root of your project and not from whatever subdirectory you happen to be in.

With no arguments it runs the default recipe:

`just`

Adding one argument specifies the recipe:

`just compile`

Arguments after '--' are exported as ARG0, ARG1, ... ARGN, which can be used in the justfile. To run recipe "compile" and export ARG0=bar and ARG1=baz:

`just compile -- bar baz`

You might want to alias `just` to `j`, so that it's even easier to run.

By way of example, the included justfile has a pinch of fanciful fluff.


getting just
------------

Just is a self-contained shell script that only depends on make and bash. You can download it from github and put it wherever you put your scripts. You can also install via macports with `port install just`.
