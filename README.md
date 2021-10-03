# void.sh

void.sh is a script written in Bash to configure Void Linux.

Don't run as ROOT you will be asked for password if needed!

## Content of the script

* Update the system
* Install recommended packages
* Install development packages ***optional***
* Install non-free and mltilib repository ***optional***
	* Install Nvidia proprietary drivers ***optional***
* Install another shell and make it the default ***optional***
* Install graphical user interface ***optional***
	* Choose a Desktop Environment ***optional***
	* Choose a Window Manager ***optional***
		* Choose a Display manager ***optional***
		* Install a terminal emulator ***optional***
		* Choose terminal text editor ***optional***
		* Choose gui text editor ***optional***
		* Choose an internet browser ***optional***
		* Choose a media player ***optional***
* Install some fonts ***optional***
* Install LibreOffice ***optional***
* Install GIMP + Inkscape ***optional***
* Install QEMU + Virt Manager ***optional***
* Choose a backup utility ***optional***
* Choose X keyboard language
* Enable required services
* Configure Cron
* Configure PulseAudio ***optional***
* Configure Network Management ***optional***
* Configure Bluetooth ***optional***
* Configure Printing support ***optional***
* Configure TLP for notebook power saving ***optional***
* Configure file sharing ***optional***
* Configure window manager  ***optional***
* Configure the Display manager ***optional***
* Start a Display manager ***optional***

## How to use

* Check if you have installed the following packages:

`xbps-install git`

* Clone the repository:

`git clone https://codeberg.org/jhroot/void-sh.git`

* Execute the script **without root privileges**:

`cd void-sh` <br>
`sh void.sh`

## Notes

* The void.sh script is not part of Void Linux, nor has it been developed by Void Linux developers.
* Use this script entirely at your own risk. Informations about the changes can be found in the CHANGES.md.
