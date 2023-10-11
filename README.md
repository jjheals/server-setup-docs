
# ufw-setup.sh

### Usage: 

    bash ./ufw-setup.sh -arg1 -arg2 ...

Accepted arguments: 

    -ssh [from_ip] : enable ssh from a specific IP address. If no from_ip is given, then ssh is enabled from any remote host

    -http ["force"] : enable http (port 80 & 443). If the literal "force" (no quotes) is given, 
    then the internal IP routing tables are modified to force HTTPS. Note that this assumes 
    the interface "eth0", but this can be modified in the script by altering the "interface" variable.
