
#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <logfile>" >&2
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: File does not exist: $1" >&2
    exit 2
fi

FAILED_PASSWORD=$(grep -c "Failed password" "$1")
echo "Failed password events: $FAILED_COUNT"

TOP_IP=$(grep "Failed password" | awk '{ for (i=1; i<=NF; i++) if ($i=="from") print $(i+1) }' | sort |uniq -c | sort -nr |head -1

TOP_3_USER=$(grep "Failed password" | awk '{for i=1; i<=NF; i++) if ($1=="for") print $(i+1)}' | sort | uniq -c | head -3
