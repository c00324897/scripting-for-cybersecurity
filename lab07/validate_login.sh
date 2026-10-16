#!/bin/bash

CURRENT="intel/users.csv"
LEGACY="case/backups/users.old"
LOG="case/logs/auth.log"

read -p "Enter your name " NAME

if [ -z "$NAME" ]; then 
    echo "Error: username cannot be empty" >&2
    exit 1
fi

if  grep -q "$NAME," "$CURRENT" ; then
    echo "CURRENT"

grep "^$NAME," "$CURRENT" | cut -d',' -f2,3

elif  grep -qx "$NAME" "$LEGACY" ; then
    echo "LEGACY"
else
    echo "UNKNOWN"
fi

FAILED=$( grep -c "Faileded password for $NAME " "$LOG" )
ACCEPTED=$(grep -c "Accepted password for $NAME " "$LOG")

echo "Failed logins: $FAILED"
echo "Accepted logins: $ACCEPTED"

if [ "$FAILED" -ge 10 ]; then
    echo "HIGH"
elif [ "$FAILED" -ge 5 ]; then
   echo "MEDIUM"
else 
    echo "LOW"
fi

STATUS=$(grep "^NAME," "CURRENT" | cut -d',' -f3)




















