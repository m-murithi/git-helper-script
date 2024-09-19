#!/bin/bash

usage() {
  echo "Usage: $0 {clone|create-branch|commit|push} [options]"
  exit 1
}

if [ "$#" -lt 1 ]; then
  usage
fi

COMMAND="$1"
shift
