# Southampton University Formula Student Team Intermediate Server
# Copyright (C) 2021 Nathan Rowley-Smith

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

FROM python:latest

SHELL ["/bin/bash", "-c"]

RUN mkdir -p /var/scripts

COPY ./ /var/scripts 

RUN apt-get update

RUN apt-get install git

# Cloning both repositories in their own directories in /var
RUN cd /var && git clone https://github.com/sufst/intermediate-server.git && cd intermediate-server && git checkout docker-implementation && ls

RUN cd /var && git clone https://github.com/sufst/back-end.git && cd back-end && git checkout docker-implementation && ls

RUN pip install --no-cache-dir --upgrade pip

# Installing python dependencies for both servers
RUN pip install --no-cache-dir -r /var/intermediate-server/requirements.txt

RUN pip install --no-cache-dir -r /var/back-end/requirements.txt

# Fix to a library that hasn't been updated yet on Pip
RUN sed -i 's/if lambda option: option < cls.UNSUPPORTED_ZDO_PASSTHRU)/if op < cls.UNSUPPORTED_ZDO_PASSTHRU)/g' /usr/local/lib/python3.10/site-packages/digi/xbee/models/mode.py

# Exposing port 5000
EXPOSE 5000

RUN chmod +x /var/scripts/startscript.sh

ENTRYPOINT /var/scripts/startscript.sh
# python /var/intermediate-server/server.py

# python /var/back-end/server.py