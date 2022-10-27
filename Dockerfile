# Southampton University Formula Student Team Intermediate Server
# Copyright (C) 2022 Andreas Demenagas

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

FROM ubuntu:latest

SHELL ["/bin/bash", "-c"]

RUN mkdir -p /var/scripts
COPY ./ /var/scripts 

# Updating repositories & installing Git
RUN apt-get update
RUN apt-get install git -y

# Installing software package dependencies
RUN apt update
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt update

# Installing Python, pip and venv dependencies
RUN apt install python3.10 -y 
RUN apt install python3-pip -y
RUN apt-get install python3-venv -y

RUN pip3 install -r /var/scripts/requirements.txt

# Intermediate server
RUN git clone https://github.com/sufst/intermediate-server.git && cd intermediate-server && git checkout docker-impl

# Back-end server
RUN git clone https://github.com/sufst/back-end.git && cd back-end && git checkout docker-impl

EXPOSE 5000

RUN chmod +x /var/scripts/startscript.sh

ENTRYPOINT /var/scripts/startscript.sh