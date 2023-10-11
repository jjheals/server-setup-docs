
# Nginx Reverse Proxy 

### Install 

    sudo apt update
    sudo apt upgrade 
    sudo apt install nginx 

### Configuration

NOTES:
- For example purposes, consider the domain being set up as "example.com"
- This example assumes we want to *force https*
- This example assumes the backend and site is hosted on the local server on port 5000

Create configuration file for this site

    sudo nano /etc/nginx/sites-available/example.com

Insert the following: 

    server {
        listen 80;
        server_name example.com;

        location / {
            return 301 https://$host$request_uri;
        }
    }

    server {
        listen 443 ssl;
        server_name your_domain.com;

        ssl_certificate /path/to/your_certificate.crt;
        ssl_certificate_key /path/to/your_private_key.key;

        # Other SSL configurations go here if necessary

        location / {
            proxy_pass http://127.0.0.1:5000;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
        }
    }
