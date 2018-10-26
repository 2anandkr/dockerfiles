#!/bin/sh
set -e

# if [ "$1" = 'npm' -a "$(id -u)" = '0' ]; then
if [ "$1" = 'npm' -a "$(id -u)" = '0' ] || [ "$1" = 'yarn' -a "$(id -u)" = '0' ]; then
    chown -R node .
    exec su-exec node "$0" "$@"
fi

exec "$@"