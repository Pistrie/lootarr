#!/bin/bash
set -e # exit when error

cat <<"EOF"
    /$$                       /$$                                  
    | $$                      | $$                                  
    | $$  /$$$$$$   /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$   /$$$$$$ 
    | $$ /$$__  $$ /$$__  $$|_  $$_/   |____  $$ /$$__  $$ /$$__  $$
    | $$| $$  \ $$| $$  \ $$  | $$      /$$$$$$$| $$  \__/| $$  \__/
    | $$| $$  | $$| $$  | $$  | $$ /$$ /$$__  $$| $$      | $$      
    | $$|  $$$$$$/|  $$$$$$/  |  $$$$/|  $$$$$$$| $$      | $$      
    |__/ \______/  \______/    \___/   \_______/|__/      |__/      
    https://gitlab.com/Pistrie/lootarr
                                                                
EOF

args=$1

stop_script() {
  docker-compose down || true
}

after_start() {
  echo ""
  echo "script finished correctly"
  echo ""
}

if [[ $args == 'start' ]]; then
  stop_script
  docker-compose up --force-recreate -d
  after_start
elif [[ $args == 'stop' ]]; then
  stop_script
  echo ""
  echo "script correctly stopped"
elif [[ $args == 'update' ]]; then
  docker-compose pull
  echo ""
  echo "updates downloaded, you can restart the containers"
elif [[ $args == 'help' ]]; then
  echo "use start if you want to start the containers with a vpn connection"
  echo "    enter your vpn provider in VPN_SERVICE_PROVIDER"
  echo "use stop if you want to stop all the containers"
  echo "use update if you want to download the newest version of all the containers"
else
  echo "unknown command: $args"
  echo "use [start | stop | update | help]"
fi
