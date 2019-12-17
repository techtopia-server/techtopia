#!/bin/bash

(
  export STACK_DIR="$1"
  REAL_STACK_DIR="`realpath $STACK_DIR`"
  shift
  STACK_NAME="$(basename "$STACK_DIR")"

  export STACK_DATA="$DATA_LOCATION/$STACK_NAME"

  ARGS=$@
  cd "$REAL_STACK_DIR"
  INIT_FILE="$REAL_STACK_DIR/init.sh"
  if [ -f "$INIT_FILE" ]; then
    source "$INIT_FILE"
  fi
  COMPOSE_FILE="$REAL_STACK_DIR/docker-compose.yml"
  if [ -f "$COMPOSE_FILE" ]; then
    docker-compose $ARGS
  fi
)