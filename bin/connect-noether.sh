#!/usr/bin/env bash

if ! command -v blueutil >/dev/null 2>&1; then
  echo "blueutil not found, run brew install blueutil" 1>&2
  exit 1
fi

blueutil -p 1
gsleep 0.5
noether_id=$(blueutil --paired --format json | jq -r '.[] | select(.name == "noether") | .address')
blueutil --connect "$noether_id"
blueutil --wait-connect "$noether_id"
