#!/bin/bash

export ROOT_DIR=$(realpath "$SCRIPT_DIR/..")
export DATA_LOCATION="$ROOT_DIR/data"
export STACK_LOCATION="$ROOT_DIR/stacks"
export MEDIA_LOCATION="$ROOT_DIR/media"
export LOCAL_IP="127.0.0.1"
ARGS=$@

if [ -f "$ROOT_DIR/.env.sh" ]; then
  source "$ROOT_DIR/.env.sh"
fi

function REQUIRE_VAR {
  eval VALUE="\$$1"
  if [ -z "$VALUE" ]; then
    echo "No \$$1 variable is defined, please set it in \"$ROOT_DIR/.env.sh\" or export it before running the command"
    exit 1
  fi
}
export -f REQUIRE_VAR

function RUN_HOOK {
  if [ -f "$ROOT_DIR/hooks/$1.sh" ]; then
    source "$ROOT_DIR/hooks/$1.sh" $ARGS
  fi
}
export -f RUN_HOOK

function RANDOM_PASS {
  openssl rand -hex 16
}
export -f RANDOM_PASS


RUN_HOOK "pre-command"

function END_SCRIPT {
  RUN_HOOK "post-command"
}