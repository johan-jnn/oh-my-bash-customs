#!/usr/bin/env bash

local DD_PORT=5000

__dd_url_to_curl() {
  local host="localhost:$DD_PORT"
  local url="$1"
  local plateform=$(echo $url | grep -oE 'deezer|youtube|spotify')
  shift

  local payload
  local path

  case $plateform in
    "deezer")
      local id=$(echo "$url" | grep -oE '[0-9]+')
      type=$(echo $url | grep -oE 'track|album|playlist')

      case $type in
        "track" | "album")
          path="download"
          payload=$(cat <<JSON
{\\"music_id\\":$id,\\"type\\":\\"$type\\",\\"add_to_playlist\\":false,\\"create_zip\\":false}
JSON
          )
        ;;

        "playlist")
          path="playlist/deezer"
          payload=$(cat <<JSON
{\\"playlist_url\\":\\"$id\\",\\"add_to_playlist\\":false,\\"create_zip\\":false}
JSON
          )
        ;;
      esac
    ;;
  esac

  if [ -n "$path" ];
  then
    local curl="curl -s $@"
    if [ -n "$payload" ];
    then
      curl="$curl -d '$payload'"
    fi

    echo "$curl $host/$path"
    return 0
  fi

  return 1
}

__dd_get_curl_commands() {
  local commands=()
  local urls_input=()
  local inputs=("$@" "$DD_HOME/downloads.list")

  for input in "${inputs[@]}"; do
    [ -z "$input" ] && continue

    if [ -f "$input" ]; then
      local content
      readarray -t content < "$input"

      [ -n "${content[*]}" ] && urls_input+=( "${content[@]}" )
    else
      urls_input+=( "$input" )
    fi
  done

  for url in "${urls_input[@]}"; do
    local command
    command=$(__dd_url_to_curl "$url")

    if [ "$?" == "0" ];
    then
      commands+=("$command")
    else
      echo "Warning: the url '$url' is not valid. Please check the syntax." >&2
    fi
  done

  IFS=$'\n' ; printf -- "${commands[*]}"
}

# Source in detached mode and without port openned
DD_RUN_ARGS="-d" DD_PORT="" source $__DIR/vars.sh 0

IFS=$'\n' read -d '' -ra tasks <<< `__dd_get_curl_commands $@`
unset __dd_get_curl_commands __dd_url_to_curl

local length="${#tasks[*]}"
if [ "$length" == "0" ]; then
  echo "No download tasks provided."
  exit
else
  echo "Found $length urls to process."
fi

printf "Launching DeezerDownloader in background\n-> $DD_RUN_CMD\n"
local CONTAINER_ID=`$DD_RUN_CMD`
if [ -z "$CONTAINER_ID" ]; then
  echo "Unable to launch the DeezerDownlader container."
  exit 1
fi
# ? The curl command is not present in the base deezerdownloader image
docker exec -u root $CONTAINER_ID apk add curl > /dev/null
printf "Container launched and initialized.\n-> $CONTAINER_ID\n"

echo "Starting downloading the given urls..."
for task in "${tasks[@]}"; do
  docker exec $CONTAINER_ID sh -c "$task" > /dev/null
done

while true; do
  local queue=$(docker exec $CONTAINER_ID sh -c "curl -fs localhost:5000/queue")
  local remaining=$(echo "$queue" | jq 'map(select(.state == "active" or .state == "waiting")) | length')

  printf "Waiting for $remaining remaining download(s)...\033[0K\r"
  if [ "$remaining" == "0" ];
  then
    break
  else
    sleep 2
  fi
done

printf "Downloads finished. Stopping container...\033[0K\n"

docker stop $CONTAINER_ID > /dev/null

echo "Done"
