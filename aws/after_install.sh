#!/bin/bash

git clone https://github.com/warengonzaga/sample-nextjs-app.git
cd sample-nextjs-app/
npm install
npm run build
npm install pm2 -g
pm2 start npm --name nextjs-app -- run start -- -p 3000
pm2 list nextjs-app