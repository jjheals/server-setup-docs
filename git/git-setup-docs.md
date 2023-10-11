
# Git 

### Install 

    sudo apt update
    sudo apt upgrade
    sudo apt install git

### Configuration

Generate RSA key pair

    ssh-keygen -t rsa -b 4096 
    : /path/to/save/key
    : passphrase (optional)

The default location is *~/.ssh/id_rsa* for the private key and *~/.ssh/id_rsa.pub* for the public key.

Get the public key 

    cat /path/to/key.pub

Add Public Key to GitHub:

- Log in to GitHub
- Navigate to the profile picture in the top right corner, then to "Settings"
- In the left sidebar, navigate to "SSH and GPG keys" > "New SSH key"
- Give your key a title
- Paste the copied public key into the "Key" field.

Set SSH as the default login method

    git config --global user.email "email@example.com"
    git config --global user.name "your_username" 
    git config --global core.SshCommand "ssh -i ~/path/to/key"

*Note that the path in the github config command should be to your private key*

### General Syntax 

To clone a private repository 

    git clone git@github.com:username/repository.git
