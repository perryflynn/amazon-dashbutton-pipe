#!/bin/bash

cd "$(dirname "$0")"
. include

MAC=$1
ID=$2
NAME=$3
CMD=$4

if [ "$MAC" == "" ] || [ "$ID" == "" ] || [ "$CMD" == "" ]; then
    echo "Usage: $0 \"mac address\" \"id\" \"name\" \"cmd\""
    exit 99
fi

SCRIPTNAME=$(basename "$(readlink -f "$CMD")")

if ! lock "$MAC"; then
    logecho "$MAC / $ID / $NAME / $SCRIPTNAME is already running - exit 98"
    exit 98
fi

"$CMD" "$MAC" "$ID" "$NAME"
RES=$?

logecho "Executed $MAC / $ID / $NAME / $SCRIPTNAME - exit $RES"

sleep 5
unlock "$MAC"

exit $RES

