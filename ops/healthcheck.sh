#!/bin/bash
URL="${1:-http://localhost:8080}"
LOG="$HOME/lab/logs/health.log"
ts=$(date '+%F %T')

code=$(curl -s -o /dev/null -m 5 -w "%{http_code}" "$URL")

if [ "$code" = "200" ]; then
  echo "$ts OK   $URL $code" >> "$LOG"
  exit 0
else
  echo "$ts FAIL $URL $code" >> "$LOG"
  exit 1
fi
