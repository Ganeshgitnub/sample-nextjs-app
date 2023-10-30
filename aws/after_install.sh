#!/bin/bash
cd /opt/frontend/

#add path
export NVM_DIR="$HOME/.nvm"	
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # loads nvm	
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # loads nvm bash_completion (node is in path now)
 
# remove module files
rm -rf node_modules package-lock.json

pwd

# delete frontend process in running pm2
pm2 delete frontend

npm install
npm run build
npm install pm2 -g
pm2 start npm --name nextjs-app -- run start -- -p 3000
pm2 list nextjs-app

# copy nginxconf file to local nginx config path
aws s3 cp s3://cpcdnginxconfig/frontend/frontendnginx /etc/nginx/sites-enabled/frontend

public_ip=$(curl -s http://checkip.amazonaws.com)
cd /etc/nginx/sites-enabled/
sed -i "s/127.0.0.1/$public_ip/g" frontend

sudo systemctl restart nginx
sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl status nginx
