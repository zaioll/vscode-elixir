#!/bin/bash

curl -sSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | apt-key add - 
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list

DEBIAN_FROTEND=noninterative apt-get update && apt-get upgrade -y
