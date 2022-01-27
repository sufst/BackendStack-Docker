#!/bin/bash

# Runs both servers in the backround
python /var/intermediate-server/server.py &
python /var/back-end/server.py &

# Stops if there is a crash or exit
wait -n
exit $?