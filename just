#!/usr/bin/env bash

# cd upwards to the justfile
while [[ ! -e justfile ]]; do
  if [[ $PWD = / ]] || [[ $PWD = $JUSTSTOP ]] || [[ -e juststop ]]; then
    echo 'No justfile found.'
    exit 1
  fi
  cd ..
done

# prefer gmake if it exists
if command -v gmake > /dev/null; then
  MAKE=gmake
else
  MAKE=make
fi

declare -a RECIPES

# export arguments after '--' so they can be used in recipes
I=0
RECIPE_END=false
for ARG in "$@"; do
  if [[ $RECIPE_END = true ]]; then
    export ARG$I=$ARG
    I=$((I + 1))
  else
    if [ $ARG = "--" ]; then
      RECIPE_END=true
    else
      RECIPES+=($ARG)
    fi
  fi
done

# go!
exec $MAKE MAKEFLAGS='' --always-make --no-print-directory -f justfile ${RECIPES[*]}
