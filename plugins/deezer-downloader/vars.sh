#!/usr/bin/env bash

# Verbose (= show warnings) if either :
# - no argument passed
# - first argument is "1"
test ! \( -z "$1" -o "$1" == 1 \)
local VERBOSE=$?

[ $DD_VERSION ] || local DD_VERSION=latest
[ $DD_HOME ] || local DD_HOME="$HOME/Music/DeezerDownloader"

if [ -z $DD_DEFAULT_CONFIG ];
then
  [ -z $DD_CONFIG_FILE ] && local DD_CONFIG_FILE="$DD_HOME/config.docker.ini"
else
  unset DD_CONFIG_FILE
fi

local DD_IMAGE="kmille2/deezer-downloader:$DD_VERSION"

local DD_PULL_CMD="docker pull $DD_IMAGE"

local DD_RUN_ARGS="$DD_RUN_ARGS --rm -v $DD_HOME:/mnt/deezer-downloader"

if [ "$DD_PORT" ];
then
  DD_RUN_ARGS="$DD_RUN_ARGS -p $DD_PORT:5000"
fi

if [ "$DD_CONFIG_FILE" ];
then

  if [ -f $DD_CONFIG_FILE -a -r $DD_CONFIG_FILE ];
  then
    DD_RUN_ARGS="$DD_RUN_ARGS -v $DD_CONFIG_FILE:/etc/deezer-downloader.ini:ro"
    [ $VERBOSE == 1 ] && echo "Config file at '$DD_CONFIG_FILE' in use."
  else
    [ $VERBOSE == 1 ] && echo "Warning : the config file at '$DD_CONFIG_FILE' does not exist (or not readable)."
    unset DD_CONFIG_FILE
  fi
fi

if [ "$DD_DEEZER_ARL" ];
then
  DD_RUN_ARGS="$DD_RUN_ARGS -e DEEZER_COOKIE_ARL='$DD_DEEZER_ARL'"
  [ $VERBOSE == 1 ] && echo "Deezer ARL token in use."
fi

local DD_RUN_CMD="docker run $DD_RUN_ARGS $DD_IMAGE"
