# DeezerDownloader utility script

Utility script to interact with [Kmille's DeezerDownloader](https://github.com/kmille/deezer-downloader) through its [Docker image](https://hub.docker.com/r/kmille2/deezer-downloader).

## Requirement

- `Docker`

- `Bash` (not working through `sh`)

## Installation

```bash
source deezer-downloader.plugin.sh

# Setup (downloads the image and creates the configuration/download folder)
deezerdownloader setup
```

## Configuration

The default configuration and download directory is `$HOME/Music/DeezerDownloader`.

The default configuration file is detected at `$HOME/Music/DeezerDownloader/config.docker.ini`.

You can override some default configuration with environement variables :

| Variable       | Default value                                                             | Description                                                         |
| -------------- | ------------------------------------------------------------------------- | ------------------------------------------------------------------- |
| DD_VERSION     | latest                                                                    | The version (tag) of the DeezerDownloader docker image              |
| DD_HOME        | "$HOME/Music/DeezerDownloader"                                            | The directory of the DeezerDownloader's configuration               |
| DD_PORT        | 5000 (only in manual mode)                                                | The port of the app's interface (accessible in localhost:<DD_PORT>) |
| DD_CONFIG_FILE | "$DD_HOME/config.docker.ini" (unset in case DD_DEFAULT_CONFIG is defined) | The location of the DeezerDownloader's configuration file           |
| DD_DEEZER_ARL  | unset                                                                     | You can pass your Deezer's arl token directly with this variable    |

## Usage

```bash
# Display help message
deezerdownloader

# Update the docker's image
deezerdownloader update

# Launch Deezer and the web interface
deezerdownloader start

# Launch Deezerdownloader in background and automatically download defined tracks/playlist
# See the help message for more informations
deezerdownloader auto
```
