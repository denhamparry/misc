#! /bin/bash

# Run to check that DNS doesn't need to be restarted:

WEBSITEURL="https://denhamparry.co.uk"

if (( $( curl $WEBSITEURL | grep -c "incident-title" ) > 0 )) ; 
then pihole restartdns && echo "$DATE - restart dns" >> /tmp/dns.output;
else "$DATE - dns ok" >> /tmp/dnscheck.output;
fi