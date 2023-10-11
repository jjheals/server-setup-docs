#!/bin/bash

git config --global user.email "$1"
git config --global user.name "$2" 
git config --global core.SshCommand "ssh -i $3"