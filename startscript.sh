#!/bin/bash

python /var/intermediate-server/server.py &
python /var/back-end/server.py &

wait -n
exit $?