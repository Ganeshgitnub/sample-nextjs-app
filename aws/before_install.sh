#!/bin/bash

#download node and npm
sudo apt update -y
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
. ~/.nvm/nvm.sh
source ~/.bashrc

#create our working directory if it doesnt exist
DIR="/opt/frontend"
if [ -d "$DIR" ]; then
  echo "${DIR} exists"
  rm -rf /opt/frontend/
else
  echo "Creating ${DIR} directory"
  mkdir ${DIR}
fi
 
#delete all the files in current directory
rm -rf /opt/frontend/*
rm -rf /opt/frontend/.gitignore

nvm install node
npm -v
node -v
