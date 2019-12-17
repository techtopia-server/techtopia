RUN_HOOK "pre-update"

"$SCRIPT_DIR/all.sh" pull
"$SCRIPT_DIR/all.sh" up -d --force-recreate --remove-orphans

RUN_HOOK "post-update"