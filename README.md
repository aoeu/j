j
=

A simple way to save and run project specific commands.

j looks upward from the current directory for a file called "just" and then runs make with that file as the makefile. With no arguments it runs the makefile's default recipe:

`j`

Arguments after the first are exported as ARG0..N, which can be used in the justfile. To run recipe "foo" and export ARG0=bar and ARG1=baz:

`j foo bar baz`

By way of example, the included just file has a pinch of fanciful fluff.
