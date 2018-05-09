#!/bin/bash

CMD=$1
CONFIG=$2

if [ "$CONFIG" != "" ] && [ "$CMD" == "-c" ]; then
  echo "$CONFIG" > /etc/joeyv/config.json
  echo -e "Use a custom configuration..."
  echo "$CONFIG"
fi

if [ "$CMD" != "" ] && [ "$CMD" != "-c" ]; then
  $*
else
  joeyv -config /etc/joeyv/config.json
fi
