#!/usr/bin/env bash
# see https://github.com/kmille/deezer-downloader#run-with-docker

deezerdownloader() {
  local __DIR=$(dirname "${BASH_SOURCE[0]}")

  case $1 in
    "manual" | "launch" | "start")
      shift
      (source $__DIR/scripts/manual.sh $@)
    ;;

    "auto")
      shift
      (source $__DIR/scripts/auto.sh $@)
    ;;

    "update")
      shift
      (source $__DIR/scripts/update.sh $@)
    ;;

    "setup")
      shift
      (source $__DIR/scripts/setup.sh $@)
    ;;

    *)
      if [ -z $1 ];
      then
        echo "Missing argument."
      else
        echo "Invalid argument \"$1\"."
      fi

      echo "---- DOCUMENTATION : ----"
      cat $__DIR/man.txt

      return 1
    ;;
  esac

  return $?
}
