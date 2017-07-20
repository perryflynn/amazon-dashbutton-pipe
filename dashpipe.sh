#!/bin/bash

cd "$(dirname "$0")"
. include

if [ ! -p $PIPE ]; then
     if [ -e "$PIPE" ]; then
         logecho "Delete non-fifo file"
         rm $PIPE
     fi
     logecho "Create fifo"
     mkfifo $PIPE
     chmod ug=rw,o=- $PIPE
fi


while true
do
    if read line <$PIPE; then

        # Get MAC address from iptables log line
        MAC=$(echo $line | awk '{print $8}' | cut -b 23-39)

        if [ -d "$MACDIR/$MAC" ]; then

            # Get id and name
            ID=$(get_id "$MAC")
            NAME=$(get_name "$MAC")

            # Count press
            countpress "$ID"

            # Log
            logecho "Dash Button press for $MAC / $ID / $NAME"

            # Clear log
            clear_idlog "$ID"
            CURLOG="$(get_idlog "$ID")"

            for I in $MACDIR/$MAC/exec_*; do
                if [ -x "$I" ]; then

                    # Execute file
                    ./saferun.sh "$MAC" "$ID" "$NAME" "$I" &>> "$CURLOG" &

                fi
            done

        else
            logecho "Unknown Dash Button press for MAC $MAC"
        fi

    fi
done

