#!/bin/bash

LOG="case/logs/access.log"
WEB_LINES=$(wc -l < "$LOG")

echo "$WEB_LINES"

BLOCK_COUNT=$(grep -c "BLOCK" case/logs/firewall.log)
echo "Number of BLOCK decisions: $BLOCK_COUNT"

TOP_ATTACKERS=$(grep "Failed password" case/logs/auth.log | awk '{for(i=1;i<=NF;i++) if($i=="from") print$(i+1)}' | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}')
echo "single most common failed-login source IP is $TOP_ATTACKERS"

SQLMAP_COUNT=$(grep -ci "sqlmap" "$LOG")
WEB_LINES=$(wc -l < "$LOG")
echo "sqlmap requests: $SQLMAP_COUNT, which is $((SQLMAP_COUNT * 100 / WEB_LINES))% of all requests"
