just
=

A handy way to run project specific commands.

just looks upward from the current directory for a file called "jusfile" and then runs make with that file as the makefile. just also sets the current working directory to where it found the justfile, so your commands are executed from the root of your project and not from whatever subdirectory you happen to be in.

With no arguments it runs the default recipe:

`just`

Adding one argument specifies the recipe:

`just foo`

Arguments after the first are exported as ARG0..N, which can be used in the justfile. To run recipe "foo" and export ARG0=bar and ARG1=baz:

`just foo bar baz`

By way of example, the included just file has a pinch of fanciful fluff.
