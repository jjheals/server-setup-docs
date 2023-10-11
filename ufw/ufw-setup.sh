#!/bin/bash

# SSH 
enable_ssh=false    # Flag to enable SSH
ssh_from=false      # Var for the SSH "from_ip"

# HTTP/HTTPS 
enable_http=false
force_https=false
interface="eth0"

# Define a regex to identify a valid IPv4 address for the
# from_ip parameter
ipv4_regex="^([0-9]{1,3}\.){3}[0-9]{1,3}$"

# Check what to enable
for arg in "$@"; do
    
    # Enable SSH 
    if [[ "$arg" == "-ssh" ]]; then 
        enable_ssh=true
        shift 
        if [[ $# -gt 0 && $# =~ ipv4_regex ]]; then 
            ssh_from="$1"
            shift
        fi
    elif [[ "$arg" == "-http" ]]; then
        enable_http=true
        shift 
        if [[ $# -gt 0 && $# == "force" ]]; then 
            force_https=true
            shift      
        fi  
    fi
done

sudo apt -y update && sudo apt upgrade
sudo apt -y install ufw

sudo ufw enable 

# Enabling/allowing based on args
# SSH
if [[ $enable_ssh ]]; then
    if [[ $ssh_from =~ $ipv4_regex ]]; then
        sudo ufw allow from $ssh_from to any port 22
    else 
        sudo ufw allow 22
    fi
fi 

# HTTP/HTTPS
if $enable_http; then
    sudo ufw allow 80
    sudo ufw allow 443

    if $force_https; then
        # Create rule to redirect HTTP to HTTPs using iptables
        sudo iptables -A PREROUTING -t nat -i $interface -p tcp --dport 80 -j REDIRECT --to-port 443
        sudo sh -c 'iptables-save > /etc/iptables/rules.v4'
    fi
fi


echo "DONE with UFW setup."
sudo systemctl status ufw
