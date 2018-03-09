#!/bin/bash

CMD=$1
CONFIG=$2

if [ "$CONFIG" != "" ] && [ "$CMD" == "-c" ]; then
  echo "$CONFIG" > /etc/v2ray/config.json
  echo -e "Use a custom configuration..."
  echo "$CONFIG"
fi

if [ "$CMD" != "" ] && [ "$CMD" != "-c" ]; then
  $*
else
  curl https://raw.githubusercontent.com/v2ray/install/master/docker/official/config.json -o /etc/v2ray/config.json 
  echo "Use Remote CF"
  v2ray -config /etc/v2ray/config.json
fi
