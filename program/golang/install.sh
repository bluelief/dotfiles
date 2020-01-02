#!/bin/bash

# Enter here to newest golang package
GOPACKAGE=go1.13.4.linux-amd64.tar.gz

# Get golang package
rm -rf $HOME/.local/lang/go
wget https://dl.google.com/go/$GOPACKAGE
tar -C $HOME/.local/lang -xzf $GOPACKAGE > /dev/null 2>&1
rm $GOPACKAGE
