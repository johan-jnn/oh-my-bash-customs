#!/usr/bin/env bash

[ $DD_PORT ] || local DD_PORT=5000

# Source in interactive mode
DD_RUN_ARGS="-it" source $__DIR/vars.sh 0

(sleep 2 && open http://localhost:$DD_PORT && open https://www.deezer.com) > /dev/null 2>&1 &
printf "Launching DeezerDownloader...\n-> $DD_RUN_CMD\n\n"

echo "/--- DEEZER_DOWNLOADER ---\\"

$DD_RUN_CMD

echo "\\--- DEEZER_DOWNLOADER ---/"
