#!/usr/bin/env bash

# Parse a markdown file to pretty-print it to terminal
markdown() {
  if [ ! `which bun` ];
  then
    echo "Missing requirement: Bun is not installed or not usable."
    return 1
  fi

  if [ "$1" ];
  then
    # Argument must be readable and not a directory
    if [ ! -r "$1" -o -d "$1" ];
    then
      echo "Bad argument: '$1' is not a readable file"
      return 1
    fi

    bun -e "console.log(Bun.markdown.ansi(await Bun.file(\`$1\`).text()))"
  elif [ ! -t 0 ];
  then
    markdown /dev/stdin
    return $?
  else
    markdown "`dirname ${BASH_SOURCE[0]}`/man.md"
  fi
}
