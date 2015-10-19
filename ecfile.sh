#!/bin/bash
if [ "$1" == "-help" ]; then
    echo "ecfile encrypt/decrypt file"
    echo
    echo "  -e encrypt"
    echo "  -d decrypt"
else
    if [ -z $2 ]; then
        echo "enter a file to encode or decode"
    else
        if [ "$1" == "-e" ]; then
            enc=".enc"
            var=$2$enc
            openssl aes-256-cbc -a -salt -in $2 -out $var
        elif [ "$1" == "-d" ]; then
            var=$2
            var=${var#*: }
            var=${var%.enc}
            openssl aes-256-cbc -d -a -in $2 -out $var
        fi
    fi
fi
