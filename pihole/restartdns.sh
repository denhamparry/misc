#! /bin/bash

# Run to check that DNS doesn't need to be restarted:

WEBSITEURL="https://denhamparry.co.uk"

if (( $( curl $WEBSITEURL | grep -c "incident-title" ) > 0 )) ; 
then printf "Restarting DNS" && pihole restartdns; 
else printf "Fully Operational"; 
fi