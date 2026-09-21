#!/usr/bin/env bash

source $__DIR/vars.sh $1

printf "Pulling DeezerDownloader... (version: $DD_VERSION)\n-> $DD_PULL_CMD\n"
local RESULT=$(( \time -qf '\n%e\n%x' $DD_PULL_CMD ) 2>&1)
local TIME=`echo "$RESULT" | tail -n 2 | head -n 1`
local CODE=`echo "$RESULT" | tail -n 1`
local LOGS=`echo "$RESULT" | head -n -2`

if [ "$CODE" != "0" ];
then
  echo $LOGS
else
  echo "Done. (${TIME}s)"
fi

exit $CODE
