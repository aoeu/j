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
