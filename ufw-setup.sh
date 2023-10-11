#!/bin/bash

enable_ssh=false    # Flag to enable SSH
ssh_from=false      # Var for the SSH "from_ip"

# Define a regex to identify a valid IPv4 address for the
# from_ip parameter
ipv4_regex="^([0-9]{1,3}\.){3}[0-9]{1,3}$"

# Check what to enable
for arg in "$@"; do
    # Check SSH
    if [ "$arg" == "-ssh" ]; then
        enable_ssh=true
    elif [[ $arg =~ $ipv4_regex ]]; then
        ssh_from="$arg"
    fi 
done

sudo apt update && sudo apt upgrade
sudo apt install ufw

sudo ufw enable 

if [[ $enable_ssh ]]; then
    if [[ $ssh_from =~ $ipv4_regex ]]; then
        sudo ufw allow from $ssh_from to any port 22
    else 
        sudo ufw allow 22
fi

echo "DONE with UFW setup."
sudo systemctl status ufw
