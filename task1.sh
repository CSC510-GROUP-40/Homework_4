#!/bin/bash

# Get all PIDs of precesses run with 'bash infinite.sh'
pids=$(ps aux | grep 'bash infinite.sh' | grep -v grep | awk '{print $2}')


# check if any processes was found
if [ -z "$pids" ]; then
  echo "No matching processes found."
else
  for pid in $pids; do
    echo "Killing process with PID: $pid"
    kill $pid
  done
fi
