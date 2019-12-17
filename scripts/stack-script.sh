STACK_NAME=$1
shift
SCRIPT_NAME=$1
shift

export STACKDIR="$STACK_LOCATION/$STACK_NAME"
export COMPOSE_FILE="$STACK_LOCATION/$STACK_NAME/docker-compose.yml"
INIT_FILE="$STACK_DIR/init.sh"
if [ -f "$INIT_FILE" ]; then
  bash "$INIT_FILE"
fi

export STACK_DATA="$DATA_LOCATION/$STACK_NAME"
bash "$STACKDIR/scripts/$SCRIPT_NAME" $@