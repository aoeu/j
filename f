#!/bin/sh

# find the fuckfile
while [ ! -e fuck ]; do
  if [ "$PWD" == / ]; then
    echo "No fuckfile found."
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
for ARG in "${@:2}"; do
  export ARG$I=$ARG
  I=$((I + 1))
done

# go!
exec $MAKE --always-make --no-print-directory -f fuck $1 MAKEFLAGS=''
