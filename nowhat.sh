#!/bin/bash

# Check if correct number of arguments
if [ $# -ne 1 ]; then
    echo "Bad arguments"
    exit 1
else
    # Check if todo file is readable
    if ! [ -r $1 ]; then
        echo "Cannot open ToDo file"
        exit 1
    fi
fi

TODO_FILE="$1"

# Read todo file except comment lines
while read LINE
do
    FIELDS=(${LINE}) # Split space delimited line into array
    ESTART=$(date --date="${FIELDS[0]}" +%s)
    EEND=$(date --date="${FIELDS[2]}" +%s)
    ENOW=$(date +%s)
    if [ $ESTART -ge $EEND ]; then
        echo "End time before start time"
        exit 1
    else
        if [ $ESTART -le $ENOW ] && [ $ENOW -lt $EEND ]; then
            echo ${FIELDS[@]}
            exit 0
        fi
    fi
done < <(grep -v "^#" "$TODO_FILE")
echo "Free time!"
