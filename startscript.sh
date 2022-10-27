#!/bin/bash

# Runs both servers in the backround
# source /var/intermediate-server/inter-server-venv/bin/activate && python server.py &
# source /var/intermediate-server/backend-venv/bin/activate && python server.py &

python3 /intermediate-server/server.py &
python3 /back-end/server.py &

# Stops if there is a crash or exit
wait -n
exit $?