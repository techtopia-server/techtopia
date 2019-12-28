#!/bin/bash
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
export SCRIPT_DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
source "$SCRIPT_DIR/bootstrap.sh"
COMMAND="$1"
shift

case "$COMMAND" in
  all)
    bash "$SCRIPT_DIR/all.sh" $@
    ;;
  single)
    bash "$SCRIPT_DIR/single.sh" $@
    ;;
  update)
    bash "$SCRIPT_DIR/update.sh" $@
    ;;
  enable)
    bash "$SCRIPT_DIR/enable.sh" $@
    ;;
  disable)
    bash "$SCRIPT_DIR/disable.sh" $@
    ;;
  list)
    bash "$SCRIPT_DIR/list.sh" $@
    ;;
  run)
    bash "$SCRIPT_DIR/stack-script.sh" $@
    ;;
  git)
    bash "$SCRIPT_DIR/git.sh" $@
    ;;
  install)
    bash "$SCRIPT_DIR/install.sh" $@
    ;;
  link)
    bash "$SCRIPT_DIR/link.sh" $@
    ;;
  run-list)
    bash "$SCRIPT_DIR/stack-script-list.sh" $@
    ;;
  *)
    echo "unknown command"
    ;;
esac

END_SCRIPT