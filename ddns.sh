#!/bin/bash
#
# This script updates Dynamic DNS records on DNS Made Easy's
# DNS servers.  You must have wget installed for this to work.
#
# Author: Jeff Larkin <fu_fish@users.sourceforge.net>
# Last Modified: 08-February-2002
#
# Author: Darron Froese <darron@froese.org>
# Last Modified: 01-June-2014
#
# Need to set several environmental variables in order for this to work:
#
# DNS_RECORD - the record to check.
# DNS_SERVER - the server to check against.
# DME_USER - your username at DNS Made Easy.
# DME_PASS - the password for that dns record.
# DME_ID - the ID for that dns record.
# INTERVAL - time between checks

while true
do
  echo "Checking again." > /proc/self/fd/1

  # Obtain current ip address
  IP_ADDRESS=$(wget -qO- http://ipv4.icanhazip.com)

  # Get the record we are supposed to check.
  DIG_COMMAND="dig $DNS_RECORD +short @$DNS_SERVER"
  CURRENT_DNS_IP=$($DIG_COMMAND)
  DATE=$(date)

  echo "$DATE: Current IP: $IP_ADDRESS. $DNS_RECORD reports: $CURRENT_DNS_IP."

  if [ "$CURRENT_DNS_IP" != "$IP_ADDRESS" ]; then
    URL="https://www.dnsmadeeasy.com/servlet/updateip?username=$DME_USER&password=$DME_PASS&id=$DME_ID&ip=$IP_ADDRESS"
    if wget -qO- "$URL" --no-check-certificate | grep success > /dev/null; then
    	echo "DNS Record Updated Successfully" > /proc/self/fd/1
    else
    	echo "Problem updating DNS record." > /proc/self/fd/1
    fi
  fi

  sleep $INTERVAL

done
