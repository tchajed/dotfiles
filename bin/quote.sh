#!/bin/bash

while read line
do
  if [[ "$line" == *" "* ]]; then
    echo "\"$line\""
  else
    echo "$line"
  fi
done < "${1:-/dev/stdin}"
