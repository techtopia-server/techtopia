#!/bin/bash

ARGS=$@

for CURRENT_DIR in "$STACK_LOCATION/"*/; do
  (
    #CURRENT_DIR="$(realpath "$CURRENT_DIR")"
    NAME="$(basename $CURRENT_DIR)"
    ENABLE_FILE="$ROOT_DIR/enabled/$NAME"
    if [ -f "$ENABLE_FILE" ]; then
      echo "✅  - $NAME"
    else
      echo "❌  - $NAME"
    fi
  )
done
