#!/bin/sh

set -e

ME=$(basename "$0")

entrypoint_log() {
    if [ -z "${NGINX_ENTRYPOINT_QUIET_LOGS:-}" ]; then
        echo "$@"
    fi
}

TIMEOUT=2
TGT_PAGE="/usr/share/nginx/html/conn-test.txt"

[ ! -n "${HOST_STR}" ] && entrypoint_log "$ME: no \${HOST_STR} is defined" && exit 0

echo "${HOST_STR}" | tr , "\n" | xargs -i sh -c "nc -vz -w ${TIMEOUT} {} || continue " &> ${TGT_PAGE}

exit 0
