# Backend Stack for Docker

This repository contains scripts for Docker to run the entire backend stack (Intermediate and Backend Servers) on Docker. 

## Installation

*We are assuming here that you already have Git installed.*

1.  Double check Docker is installed on your computer.

   > **For Windows**
   >
   > Go to https://docs.docker.com/desktop/windows/install/ . Download and Install appropriately. 
   >
   > To run shell commands in Docker, use **Windows Powershell**. 

   > **For MacOS**
   >
   > If you haven't installed Homebew already, enter these commands into the MacOS Terminal. 
   >
   > `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
   >
   > Once installed, install Docker using the command
   >
   > `brew install --cask docker `

   > **For Linux**
   >
   > Docker should be listed in the majority of Distros package managers repos. Below are shell commands to install Docker on the most common Distros.
   >
   > >  Debian based *including Ubuntu*
   > >
   > > `sudo apt-get install docker`
   >
   > > Arch based *including Manjaro*
   > >
   > > `sudo pacman -Sy docker`
   >
   > > Fedora based
   > >
   > > `sudo dnf install docker`

2. Clone this repository into a suitable location on your computer.

   `https:// --fill this in later`

3. We are now going to build the docker image. In your terminal, navigate to the repository and enter the command:

   > **Windows and MacOS** 
   >
   > Double check in Windows that you are running powershell in administrator
   >
   > `docker build -t entire-backend .`

   > **Linux**
   >
   > `sudo docker build -t entire-backend .`

4. Give docker time to build the image. Once it has built, we need to create a container instance of this image. 

   > **Windows and MacOS**
   >
   > `docker container run --name EntireBackend entire-backend `

   > **Linux**
   >
   > `sudo docker container run --name EntireBackend entire-backend ` 

5. The container should now be running. Next step we need to do is get the containers IP address for the frontend to point to. 

   > **Windows and MacOS**
   >
   > `docker inspect EntireBackend `
   >
   > Use your find tool in your terminal and search 'IPAddress'. Your containers IP address should be listed. 

   > **Linux**
   >
   > `sudo docker inspect EntireBackend | grep "IPAddress"`
   >
   > Grep should list your docker IP address to your terminal.

6. In the Frontends config file, change the IP address to your docker containers IP address. The reason we do this, is that your container is not using the same IP address as your computer, using a virtualised bridge network. 

# Other Information

* This repository fetches the latest version of Intermediate and Backend servers on the  *docker-implementation* branches. Commits to *main* branch must be copied over to *docker-implementation* to be on the latest version of those servers. 

* To close your container, enter the command:

  > **Windows and MacOS**
  >
  > `docker container stop EntireBackend`

  > **Linux**
  >
  > `sudo docker container stop EntireBackend`

