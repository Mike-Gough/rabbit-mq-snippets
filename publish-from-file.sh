#!/usr/bin/env bash

if [[ $# -ne 5 ]] ; then
    echo 'This script can be used to publish messages from a file to an exchange.'
    echo 'For instance:'
    echo './publish-from-file.sh exchange-name routing-key user-name password file-path'
    exit 1
fi

EXCHANGE=${1}
ROUTING_KEY=${2}
USER=${3}
PASSWORD=${4}
FILE=${5}

while read p; do
  payload=$(echo $p| awk 'BEGIN { FS = "|" } ; { print $1 }')
  properties=$(echo $p| awk 'BEGIN { FS = "|" } ; { print $2 }')
  CMD=$'rabbitmqadmin publish exchange='${EXCHANGE}' routing_key='$ROUTING_KEY' payload="'$payload'" properties='$properties' -u '$USER' -p '$PASSWORD
  $CMD
done <$FILE
