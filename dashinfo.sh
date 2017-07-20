#!/bin/bash

cd "$(dirname "$0")"
. include

PADLEN=$(($(echo "$(echo ""; ls -1 "${NAMEDIR}/")" | while read line; do echo $line | wc -c; done | sort -r | head -n 1)+2))

function pad()
{
    printf "%-${2}s" "$1"
}

function idlist()
{
    find "${MACDIR}"/* -maxdepth 1 -type d | while read MACITEM
    do
        MAC=$(basename "$MACITEM")
        ID=$(get_id "$MAC")
        NAME=$(get_name "$MAC")
        echo "$(pad "$ID" 5) $(pad "$NAME" $PADLEN) $(pad "$MAC" 20)"
    done
}


echo
echo "List of assigned dash buttons:"
echo

echo "$(pad "ID" 5) $(pad "NAME" $PADLEN) $(pad "MAC" 20)"
idlist | sort

echo

exit 0

