#!/bin/bash

echo
echo
echo "Welcome to The_Generic_Setup_Assistant! How can I help you today?"
echo
myBool=1
#This is where the bulk of the code is going to branch from.
function main(){
	while [ $myBool = 1 ]
	do
	echo "Main menu input options:"
	echo "> \"update\" - Update your computer [*I recomend you run me first!*]"
	echo "> \"install\" - Add programs to your computer"
	echo "> \"q\" - Quit this script"
	read myVar
	echo
	case $myVar in
		update)
			sudo apt-get update
			sudo apt-get upgrade
			;;
		install)
			installBool=1
			installers
			;;
		q)
			myBool=0
			;;
		*)
			echo "Unrecognized input, please try again!"
			;;
	esac
	done
}

#This is where the install scripts are going to be.
function installers(){
	while [ $installBool = 1 ]
	do
	echo
	echo "Install input options:"
	echo "\"steam\" - The debian installer for Steam!"
	echo "\"obs\" - Open Broadcasting Software, great for recording and streaming video"
	echo "\"vlc\" - Multimedia video/audio player"
	echo "\"htop\" - Linux terminal task manager"
	echo "\"browser\" - Takes you to the browser sub-menu"
	echo "\"back\" - Go back to the main menu"
	read installVar
	echo
	case $installVar in
		vlc)
			sudo apt-get install vlc
			;;
		steam)
			sudo apt-get install steam-installer
			echo
			echo
			echo
			echo "Note to self, remember to add guide/instructions for how to add Steam games from NTFS file systems! Y'know, with making the compatdata folder, linking the NTFS Steam folders to it, and double checking Proton is running correctly, etc, etc."
			;;
		obs)
			sudo apt-get install obs-studio
			;;
		htop)
			sudo apt-get install htop
			;;
		browser)
			browserBool=1
			browsers
   			;;
		back)
			installBool=0
			;;
		*)
			echo "Unrecognized input, please try again!"
			;;
	esac
	done
}
function browsers(){
	while [ $browserBool = 1 ]
	do
		echo
		echo "Browser input options:"
		echo "\"brave\" - Privacy-minded web browser"
		read browserVar
		echo
		case $browserVar in
			brave)
				sudo apt-get install curl
				curl -fsS https://dl.brave.com/install.sh | sh
				#curl link taken from their direct site, "brave.com/linux"
				;;
    		esac
	done
}

main
