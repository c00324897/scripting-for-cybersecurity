#!/bin/bash

FILE=$1
EXT="${FILE##*.}"

LINES=$(wc -l < "$FILE")
if [ "$LINES" -eq 0 ]; then
    echo "$FILE has $LINES lines "

if [ "$EXT" = "log" ]; then
    echo "$FILE : log file"
elif [ "$EXT" = "conf" ]; then
    echo "$FILE : configuration file"
elif [ "$EXT" = "txt" ] || [ "$EXT" = "md" ]; then
    echo "$FILE : text document"
elif [ "$EXT" = "sh" ] || [ "$EXT" = "py" ]; then
    echo "$FILE : script"
else
    echo "$FILE : unrecognised extension '$EXT'"
fi
