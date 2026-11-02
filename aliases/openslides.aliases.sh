# An alias to quickly launch OpenSlides
# See how to install in https://open-slide.dev/docs/getting-started
# After installing, assign the installation directory to the bellow's OPENSLIDES_HOME variable
# Then, create an executable launch.sh file in the OpenSlides' directory and place the following content in it :

# # launch.sh
# bun dev --open &>/dev/null &
# _OPENSLIDES_SERVER_PID="$!"
# claude $@
# kill $_OPENSLIDES_SERVER_PID
# unset _OPENSLIDES_SERVER_PID

OPENSLIDES_HOME="$HOME/Documents/openslides"
[ -d "$OPENSLIDES_HOME" ] && alias openslides="cd $OPENSLIDES_HOME && ./launch.sh && cd \"$(pwd)\""
