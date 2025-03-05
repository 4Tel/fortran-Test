#!/bin/bash
src="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
if [ $# -eq 0 ];then
  x=$(echo -e "\n1. run local \n2. run qfile\nchoice: ")
  read -p "$x" i
else
  i="$@"
fi

case "$i" in
  1) time mpirun -n 4 ./main.x;;
  2) qsub "$src/qfile";;
  *) echo "invalid value: $i";exit 1;;
esac
