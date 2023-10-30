#!/bin/bash
cd /opt/frontend/

#add path
export NVM_DIR="$HOME/.nvm"	
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # loads nvm	
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # loads nvm bash_completion (node is in path now)
 
# remove module files
rm -rf node_modules package-lock.json

pwd
npm install
npm run build
npm install pm2 -g
pm2 start npm --name nextjs-app -- run start -- -p 3000
pm2 list nextjs-app

# copy nginxconf file to local nginx config path
aws s3 cp s3://cpcdnginxconfig/frontend/frontendnginx /etc/nginx/sites-enabled/frontend

sudo systemctl restart nginx
sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl status nginx
