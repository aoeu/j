#!/bin/sh

# find the justfile
while [ ! -e justfile ]; do
  if [ "$PWD" = "/"  ] || [ "$PWD" = "$JUSTSTOP" ] || [ -e juststop ]; then
    echo "No justfile found."
    exit 1
  fi
  cd ..
done

# use gmake if it exists
if command -v gmake > /dev/null; then
  MAKE=gmake
else
  MAKE=make
fi

# export arguments so they can be used in recipes
I=0
for ARG in "$@"; do
  export ARG$I=$ARG
  I=$((I + 1))
done

# go!
exec $MAKE --always-make --no-print-directory -f justfile $1 MAKEFLAGS=''
