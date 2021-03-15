#!/bin/bash 

set -e

this_directory=$(dirname "$0")
if [[ ! -f "${this_directory}/demo.cfg" ]]; then 
  echo "You must have a demo.cfg file in the same directory as this script"
  exit;
fi

source ${this_directory}/demo.cfg

# Set up

echo "Setting up for the demo"
cf push sample-app -p $SAMPLE_APP_PATH -f $SAMPLE_APP_PATH/manifest.yml --var route="${APP_HOSTNAME}.${APP_DOMAIN}"

source ${DEMO_MAGIC_PATH}/demo-magic.sh 
clear

pe "cf a" # Show the app on the external domain


# Move the app to an internal domain
pe "cf map-route sample-app apps.internal --hostname $APP_HOSTNAME" # map internal route

pe "cf unmap-route sample-app $APP_DOMAIN --hostname $APP_HOSTNAME" # unmap external route


# Deploy nginx on the external route
pe "cf push -f ${this_directory}/../nginx-proxy/manifest.yml -p ${this_directory}/../nginx-proxy --var route=${APP_HOSTNAME}.${APP_DOMAIN} --var proxied_route=${APP_HOSTNAME}.apps.internal --var proxied_port=8080"

pe "cf a"


# Add network policy
pe "cf add-network-policy nginx-proxy sample-app --protocol tcp --port 8080"

