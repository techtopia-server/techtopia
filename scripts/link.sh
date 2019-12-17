NAME="$1"

if [ -z "$1" ]; then
  echo "No name provided"
  exit 1
fi

ln -s "$PWD" "$STACK_LOCATION/$NAME"