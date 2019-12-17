STACK_NAME=$1
shift
SCRIPT_NAME=$1
shift

STACKDIR="$STACK_LOCATION/$STACK_NAME"

if [ -d "$STACKDIR/scripts" ]; then
  ls "$STACKDIR/scripts"
else
  echo "No scripts"
fi