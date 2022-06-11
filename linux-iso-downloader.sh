#!/bin/bash
set -e # exit when error

cat << "EOF"
     /$$       /$$                                     /$$$$$$  /$$$$$$   /$$$$$$           
    | $$      |__/                                    |_  $$_/ /$$__  $$ /$$__  $$          
    | $$       /$$ /$$$$$$$  /$$   /$$ /$$   /$$        | $$  | $$  \__/| $$  \ $$  /$$$$$$$
    | $$      | $$| $$__  $$| $$  | $$|  $$ /$$/        | $$  |  $$$$$$ | $$  | $$ /$$_____/
    | $$      | $$| $$  \ $$| $$  | $$ \  $$$$/         | $$   \____  $$| $$  | $$|  $$$$$$ 
    | $$      | $$| $$  | $$| $$  | $$  >$$  $$         | $$   /$$  \ $$| $$  | $$ \____  $$
    | $$$$$$$$| $$| $$  | $$|  $$$$$$/ /$$/\  $$       /$$$$$$|  $$$$$$/|  $$$$$$/ /$$$$$$$/
    |________/|__/|__/  |__/ \______/ |__/  \__/      |______/ \______/  \______/ |_______/ 
    https://gitlab.com/Pistrie/linux-iso-downloading-setup
EOF

args=$1

stop_script() {
  docker-compose down --remove-orphans || true
}

if [[ $args == 'start' ]]; then
  stop_script
  docker-compose up --force-recreate -d
elif [[ $args == 'start:vpn' ]]; then
  stop_script
  docker-compose -f docker-compose.yaml -f vpn/docker-compose.yaml up --force-recreate -d
elif [[ $args == 'stop' ]]; then
  stop_script
  echo ""
  echo "script correctly stopped"
elif [[ $args == 'update' ]]; then
  docker-compose pull
else
  echo "unknown command: $args"
  echo "use [start | start:vpn | stop | update]"
fi
