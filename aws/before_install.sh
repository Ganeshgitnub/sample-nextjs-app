#!/bin/bash

#download node and npm
sudo apt update -y
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
. ~/.nvm/nvm.sh
source ~/.bashrc
nvm install node
npm -v
node -v
