#!/bin/bash
# Warning do not run this Script with sudo as your server will end up getting installed with fucked-up permissions and never gonna start, just run with normal user and provide the password whenever asked by the script
# First Detect the os
. /etc/os-release
echo "Your OS is $ID"

if [ "$ID" == "ubuntu" ]; then
    echo "if working for ubuntu"
    echo "ops still testing1"
    # Lets create a folder in which our server will be installed
    mkdir CSGO_Server
    # Change to server Directory
    cd CSGO_Server
    # Add i386 architecture
    sudo dpkg --add-architecture i386
    # Run package defination update
    sudo apt update
    # install vim and htop some usefull packages
    sudo apt install vim htop
    # now as we are going to use LGSM we will install Dependencies of LGSM
    sudo apt install mailutils postfix curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux lib32gcc1 libstdc++6 libstdc++6:i386
    # wget LGSM
    wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh csgoserver
    # in the end start server installation
    ./csgoserver auto-install
fi

if [ "$ID" == "centos" ]; then
    echo "if working for centos"
    echo "ops still testing2"
    # Lets create a folder in which our server will be installed
    mkdir CSGO_Server
    # Change to server Directory
    cd CSGO_Server
    # EPEL is required to install some dependencies needed for using LinuxGSM on CentOS.
    sudo yum install epel-release
    # install vim and htop some usefull packages
    sudo yum install vim htop
    # now as we are going to use LGSM we will install Dependencies of LGSM
    sudo yum install mailx postfix curl wget bzip2 gzip unzip python binutils bc jq tmux glibc.i686 libstdc++ libstdc++.i686
    # A package needed to properly connect sourcemod with mysql only neede in centos
    sudo yum install zlib.i686
    # wget LGSM
    wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh csgoserver
    # in the end start server installation
    ./csgoserver auto-install
fi

echo "Your server is installed sucessfully run ./csgoserver to see all the commands and instruction on how to run and use server or go-to https://docs.linuxgsm.com/commands"
