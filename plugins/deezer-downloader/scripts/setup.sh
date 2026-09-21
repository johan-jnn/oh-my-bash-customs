source "$__DIR/vars.sh" 0
[ $DD_CONFIG_FILE ] || local DD_CONFIG_FILE="$DD_HOME/config.docker.ini";

mkdir -p "$DD_HOME" "$(dirname $DD_CONFIG_FILE)"
(source $__DIR/scripts/update.sh)
[ -f "$DD_CONFIG_FILE" ] || docker run --rm "$DD_IMAGE" deezer-downloader -t > "$DD_CONFIG_FILE"

echo
echo "Configuration finished. You may have to edit your configuration file :"
echo "-> $DD_CONFIG_FILE"
echo "The songs will be downloaded here :"
echo "-> $DD_HOME/... (placed in sub-folders to organize them)"
echo
echo "You can get more information about this tool by calling it without any argument."
echo "Enjoy !"
