#!/bin/bash

(cd ./lib && make && make)
find . -maxdepth 3 -type f -name "*.f90" -exec dirname {} \; | sort -u | while read -r dir; do
  echo -e "${KCYN}Entering directory${KNRM}: $dir"

  if [ ! -f Makefile ]; then
    echo -e "${KRED}Makefile not found in $dir${KNRM}"
    exit 1
  fi

  (cd "$dir" && make)

  if [ $? -ne 0 ]; then
    echo -e "${KRED}Make failed in $dir${KNRM}"
    exit 1
  fi
done
