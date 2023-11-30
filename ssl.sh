#!/bin/bash

domains=$1
email="votre@email.com"
ip="votre_ip"
sslok="1"

IFS=',' read -ra DOMS <<< "$domains"

function domaincheck()
{
    for domain in "${DOMS[@]}"
    do
        ip_mismatch_found="0"
        domain_ips=$(host $domain)

        checkips=$(echo "$domain_ips" | awk '/has address|IPv6 address/ {print $NF}' | sort -u)

        for addr in $checkips
        do
            if [[ -z $addr || $addr != $ip ]]
            then
                ip_mismatch_found="1"
                break
            fi
        done

        if [[ -z $checkips ]]
        then
            ip_mismatch_found="1"
        fi

        if [[ $ip_mismatch_found == "0" ]]
        then 
            echo "$domain validated"
        else
            echo "$domain is not validated : IP mismatch"  
            echo "DNS records for $domain:"
            echo "$domain_ips"         
        fi
    done
}

domaincheck $domains

if [[ $sslok == 0 ]]
then
    exit 
else
    certbot -n --agree-tos --email "$email" --installer apache --webroot -w "/home/letsencrypt" --domains "$domains"
fi

