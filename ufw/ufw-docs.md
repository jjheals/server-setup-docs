
# UFW Firewall Setup

### Install 

    sudo apt update
    sudo apt upgrade
    sudo apt install ufw

    sudo ufw enable

### Enable SSH (optional) 

    sudo ufw allow from [IP_ADDRESS] to any port 22

### Enable HTTP/HTTPS 

    sudo ufw allow 80
    sudo ufw allow 443

# General Syntax 

### Allow a port

Allow from any external IP

    sudo ufw allow [PORT_NUM] 
    
Allow specific port from a specific external IP  

    sudo ufw allow from [FROM_IP] to any port [PORT_NUM] 

### Set Default policies

    // Implicit deny incoming 
    sudo ufw default deny incoming

    // Implicit allow outgoing
    sudo ufw default allow outgoing
