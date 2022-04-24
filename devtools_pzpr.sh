#!/bin/bash

if [ -f "/usr/bin/devtools_lock" ];
then
    echo "Usage of devtools on this system is prohibited."
	echo "For futher information, please contact technical support: piotrbadelek@proton.me"
	exit 1
fi

if [ "$EUID" -ne 0 ]
  then echo "Please run as root."
  exit
fi

echo "                               #######  #####     ######
#####  ###### #####  #         #     # #     #    #     # ###### #    # #####  ####   ####  #       ####
#    #     #  #    # #         #     # #          #     # #      #    #   #   #    # #    # #      #
#    #    #   #    # #         #     #  #####     #     # #####  #    #   #   #    # #    # #       ####
#####    #    #####  #         #     #       #    #     # #      #    #   #   #    # #    # #           #
#       #     #      #         #     # #     #    #     # #       #  #    #   #    # #    # #      #    #
#      ###### #      ######    #######  #####     ######  ######   ##     #    ####   ####  ######  ####

"
echo "This is pre-release software. Bugs may occur. Unauthorized distribution of pzpl OS pre-release builds is prohibited."
echo "Choose option: "
echo "1) Download and update pzpl-OS/web-browser-manager from GitHub"
echo "2) Download and update pzpl-OS/devtools from GitHub"
echo "3) Download pzpl-OS/wbm-remake from GitHub"
echo "4) Generate debug log"
read choice

if [ $choice = 1 ];
then
	wget https://github.com/pzpl-OS/web-browser-manager/archive/refs/heads/focal.zip
	unzip focal.zip
	rm focal.zip
	rm /usr/bin/browser-manager
	rm /usr/bin/browser-manager-pre
	cp ./web-browser-manager-focal/usr/bin/browser-manager /usr/bin
	cp ./web-browser-manager-focal/usr/bin/browser-manager-pre /usr/bin
	rm -rf /usr/share/browser-manager
	mkdir /usr/share/browser-manager
	cp -r ./web-browser-manager-focal/usr/share/browser-manager /usr/share/browser-manager
	cp -r ./web-browser-manager-focal/usr/share/polkit-1/actions /usr/share/polkit-1/actions
	rm -rf ./web-browser-manager-focal
	echo "Updated."
fi

if [ $choice = 2 ];
then
	wget https://github.com/pzpl-OS/devtools/archive/refs/heads/master.zip
	unzip master.zip
	rm master.zip
	rm /usr/bin/devtools_pzpl
	cp ./devtools-master/devtools_pzpl /usr/bin
	echo "Updated."
fi

if [ $choice = 3 ];
then
	wget https://github.com/pzpl-OS/wbm-remake/archive/refs/heads/master.zip
	unzip master.zip
	rm master.zip
	echo "Downloaded."
fi

if [ $choice = 4 ];
then
	neofetch	
fi
