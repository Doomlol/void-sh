# void.sh

void.sh is a script written in Bash to configure Void Linux.

## Content of the script

* Update the system
* Install recommended packages
* Install development packages ***optional***
* Install another shell and make it the default ***optional***
* Install the X Window System ***optional***
	* Choose a Desktop Environment ***optional***
	* Choose a Window Manager ***optional***
	* Choose a Display manager ***optional***
	* Install some fonts ***optional***
	* Install an internet browser ***optional***
	* Install LibreOffice ***optional***
	* Install GIMP + Inkscape ***optional***
	* Install QEMU + Virt Manager ***optional***
	* Install a terminal emulator ***optional***
	* Install a backup utility ***optional***
	* Install a media player ***optional***
	* Start required services
* Configure Cron
* Configure PulseAudio ***optional***
* Configure Network Management ***optional***
* Configure Bluetooth ***optional***
* Configure Printing support ***optional***
* Configure TLP for notebook power saving ***optional***
* Configure the Display manager
* Start a Display manager ***optional***

## How to use

* Check if you have installed the following packages:

`xbps-install git`

* Clone the repository:

`git clone https://codeberg.org/fsraven/void-sh.git`

* Execute the script **without root privileges**:

`cd void-sh` <br>
`sh void.sh`

## Notes

* The void.sh script is not part of Void Linux, nor has it been developed by Void Linux developers.
* Use this script entirely at your own risk. Informations about the changes can be found in the CHANGES.md.
