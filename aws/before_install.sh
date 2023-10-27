#!/bin/bash

#download node and npm
sudo apt update -y
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
. ~/.nvm/nvm.sh
source ~/.bashrc

#create our working directory if it doesnt exist
DIR="/root/frontend"
if [ -d "$DIR" ]; then
  echo "${DIR} exists"
  rm -rf /root/frontend/
else
  echo "Creating ${DIR} directory"
  mkdir ${DIR}
fi
 
#delete all the files in current directory
rm -rf /root/frontend/*
rm -rf /root/frontend/.gitignore

nvm install node
npm -v
node -v
