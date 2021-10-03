#!/bin/bash
# Color definitions
blue=$(tput setaf 4)
black=$(tput setaf 0)
green=$(tput setaf 2)
white=$(tput setaf 7)
red=$(tput setaf 1)
none=$(tput sgr0)
bb=$(tput setab 0)
rb=$(tput setab 1)
yb=$(tput setab 3)

version="0.6.2"
progname=${0##*/}

echo "${bb}${white}# $progname - Version: $version                #${bb}"
echo "${bb}${white}# Original author: Raven                        #${bb}"
echo "${rb}${black}# SRC: https://codeberg.org/jhroot/void-sh   #${bb}"
echo "${rb}${black}# contributor: oSoWoSo <osowoso@protonmail.com> #${bb}"
echo "${yb}${black}# https://codeberg.org/oSoWoSo                  #${bb}"
echo "${yb}${black}# XBPS version: $(xbps-query -v --version | sed 's/GIT: UNSET//')     #${bb}"
echo
echo -e "\n${red}Let's begin installing...${none}\n"

echo -e "\n${green}Choose answer or press Enter for next question...${none}\n"

# Update the System

echo -e "\n${blue}Checking for updates...${none}\n"
sudo xbps-install -Su
echo -e "\n${green}Done${none}\n"

# Install recommended packages

echo -e "\n${blue}Install recommended packages...${none}\n"
sudo xbps-install curl wget unzip zip gptfdisk mtools mlocate \
	ntfs-3g fuse-exfat bash-completion linux-headers
echo -e "\n${green}Done${none}\n"

# Install development packages

read -p "Do you want to install development tools? (y) " devtools
case $devtools in
	y )
	sudo xbps-install autoconf automake bison m4 make libtool flex meson ninja \
		optipng sassc
	echo -e "\n${green}Done${none}\n"
	;;

esac

# Install Non free and multilib repository

read -p "Do you want to install non-free and multilib repository? (y) " nonfree
case $nonfree in
	y )
	sudo xbps-install void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree
	sudo xbps-install -S
	echo -e "\n${green}Done${none}\n"
# Install Latest Nvidia proprietary drivers
	read -p "Do you want to install latest Nvidia proprietary drivers? (y) " nvidia
	case $nvidia in
		y )
		sudo xbps-remove fx86-video-nouveau
		sudo xbps-install nvidia
		echo -e "\n${green}Done${none}\n"
		;;

	esac
	;;

esac

# Install shell

echo -e "\n${blue}Change user default shell...${none}\n"
printf "Possible (type in number): \n
- 1 Fish
- 2 Zsh\n"
read -p "Which shell do you want?" shell
case $shell in
	1 )
	echo -e "\n${blue}Install Fish...${none}\n"
	sudo xbps-install fish-shell
	sudo usermod --shell /bin/fish "$USER"
	;;

	2 )
	echo -e "\n${blue}Install Zsh...${none}\n"
	sudo xbps-install zsh zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-syntax-highlighting
	sudo usermod --shell /bin/zsh "$USER"
	;;

esac

# Graphical User interface

echo -e "\n${blue}Install Graphical user interface?${none}\n"
printf "Possible (type in number): \n
- 1 Desktop environment
- 2 Window manager
- 3 Xorg only
- 4 Wayland Only\n"
read -p "Do you want to instal Desktop environment or Window manager?" gui
case $gui in
	1 )
	echo -e "\n${blue}Which Desktop environment do you want?${none}\n"
	printf "Possible (type in number): \n
	- 1 Xfce
	- 2 MATE
	- 3 GNOME
	- 4 KDE Plasma
	- 5 Budgie
	- 6 Cinnamon
	- 7 LXQt
	- 8 Enlightenment
	- 9 LXDE
	- 10 Lumina\n"
	read -p "Which Desktop environment do you want?" desktop
	case $desktop in
		1 )
# Xfce
		echo -e "\n${blue}Install Xfce...${none}\n"
		sudo xbps-install xorg-minimal xfce4-appfinder xfce4-battery-plugin xfce4-clipman-plugin xfce4-cpufreq-plugin \
			xfce4-cpugraph-plugin xfce4-dict xfce4-diskperf-plugin xfce4-fsguard-plugin \
			xfce4-genmon-plugin xfce4-mailwatch-plugin xfce4-mpc-plugin xfce4-netload-plugin \
			xfce4-notifyd xfce4-panel xfce4-panel-appmenu xfce4-places-plugin xfce4-power-manager \
			xfce4-pulseaudio-plugin xfce4-screensaver xfce4-screenshooter xfce4-sensors-plugin \
			xfce4-session xfce4-settings xfce4-systemload-plugin xfce4-taskmanager xfce4-terminal \
			xfce4-timer-plugin xfce4-verve-plugin xfce4-whiskermenu-plugin xfce4-xkb-plugin \
			Thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin ristretto \
			xarchiver mousepad xfwm4 xfdesktop zathura zathura-pdf-poppler gvfs gvfs-mtp gvfs-gphoto2 \
			xfce-polkit parole
		echo -e "\n${green}Done${none}\n"
		;;

		2 )
# Mate
		echo -e "\n${blue}Install MATE...${none}\n"
		sudo xbps-install xorg-minimal mate-applets mate-backgrounds mate-calc mate-control-center mate-desktop \
			mate-icon-theme mate-indicator-applet mate-media mate-menus mate-notification-daemon \
			mate-panel mate-panel-appmenu mate-screensaver mate-sensors-applet mate-session-manager \
			mate-settings-daemon mate-system-monitor mate-terminal mate-themes mate-tweak mate-utils \
			mozo pluma caja caja-image-converter caja-sendto caja-open-terminal caja-wallpaper \
			caja-xattr-tags eom atril gvfs gvfs-mtp gvfs-gphoto2 engrampa mate-power-manager mate-polkit
		echo -e "\n${green}Done${none}\n"
		;;

		3 )
# Gnome
		echo -e "\n${blue}Install GNOME...${none}\n"
		sudo xbps-install xorg-minimal gnome-shell gnome-control-center gnome-tweaks gnome-system-monitor gnome-terminal gdm \
			gnome-disk-utility nautilus nautilus-sendto gvfs gvfs-mtp gvfs-gphoto2 eog eog-plugins \
			evince gedit gedit-plugins gnome-video-effects gnome-themes-extra gnome-session gnome-screenshot \
			gnome-shell-extensions gnome-icon-theme gnome-icon-theme-extras gnome-icon-theme-symbolic \
			gnome-backgrounds file-roller chrome-gnome-shell totem
		echo -e "\n${blue}Includes: GNOME Calendar, GNOME Clocks, GNOME Weather, Evolution, GNOME Font Viewer,"
		echo "GNOME Calculator, GNOME Characters, GNOME Contacts, GNOME Documents, GNOME Maps${none}\n"
		read -p "Do you want to install GNOME applications? (y) " gnomeapps
		case $gnomeapps in
			y )
			echo -e "\n${blue}Install GNOME applications...${none}\n"
			sudo xbps-install gnome-calendar gnome-clocks gnome-weather evolution gnome-font-viewer \
				gnome-calculator gnome-characters gnome-contacts gnome-documents gnome-maps
			;;

		esac

		echo -e "\n${green}Done${none}\n"
		;;

		4 )
# KDE Plasma
		echo -e "\n${blue}Install KDE Plasma...${none}\n"
		sudo xbps-install xorg-minimal plasma-desktop plasma-disks plasma-thunderbolt plasma-systemmonitor plasma-pa plasma-nm \
			plasma-firewall plasma-browser-integration plasma-vault latte-dock oxygen kdegraphics-thumbnailers \
			dolphin dolphin-plugins kate5 konsole okular gwenview ark sddm sddm-kcm yakuake spectacle \
			partitionmanager ffmpegthumbs kde-gtk-config5
# KDE Apps
		echo -e "\n${blue}Includes: KMail, Kontact, KOrganizer, KAddressbook, Akregator, Konversation, KCalc, KCharSelect${none}\n"
		read -p "Do you want to install KDE applications? (y) " kdeapps
		case $kdeapps in
			y )
			echo -e "\n${blue}Install KDE applications...${none}\n"
			sudo xbps-install kmail kontact korganizer kaddressbook akregator konversation kcalc kcharselect
			;;

		esac

# KDE Connect
		read -p "Do you want to use KDE Connect? (y) " kdeconnect
		case $kdeconnect in
			y )
			echo -e "\n${blue}Install KDE Connect...${none}\n"
			sudo xbps-install kdeconnect
			;;

		esac

		echo -e "\n${green}Done${none}\n"
		;;

		5 )
# Budgie
		echo -e "\n${blue}Install Budgie...${none}\n"
		sudo xbps-install xorg-minimal budgie-desktop gnome-control-center gnome-system-monitor gnome-terminal nautilus \
			nautilus-sendto gnome-keyring evince gedit gedit-plugins eog eog-plugins gnome-screenshot \
			gnome-disk-utility gvfs gvfs-mtp gvfs-gphoto2 file-roller
		echo -e "\n${green}Done${none}\n"
		;;

		6 )
# Cinnamon
		echo -e "\n${blue}Install Cinnamon...${none}\n"
		sudo xbps-install xorg-minimal cinnamon gnome-system-monitor gnome-terminal gnome-screenshot gnome-disk-utility \
			gnome-keyring gedit gedit-plugins evince gvfs gvfs-mtp gvfs-gphoto2 eog eog-plugins file-roller
		echo -e "\n${green}Done${none}\n"
		;;

		7 )
# Lxqt
		echo -e "\n${blue}Install LXQt...${none}\n"
		sudo xbps-install xorg-minimal lxqt-about lxqt-admin lxqt-archiver lxqt-build-tools lxqt-config lxqt-globalkeys \
			lxqt-openssh-askpass lxqt-panel lxqt-policykit lxqt-powermanagement lxqt-qtplugin lxqt-runner lxqt-session \
			lxqt-sudo lxqt-themes obconf-qt openbox pcmanfm-qt lximage-qt FeatherPad qlipper qterminal lxqt-notificationd
		echo -e "\n${green}Done${none}\n"
		;;

		8 )
# Enlightenment
		echo -e "\n${blue}Install Enlightenment...${none}\n"
		sudo xbps-install enlightenment terminology mousepad gvfs gvfs-mtp gvfs-gphoto2 zathura zathura-pdf-poppler \
			Thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin xarchiver
		echo -e "\n${green}Done${none}\n"
		;;

		9 )
# Lxde
		echo -e "\n${blue}Install LXDE...${none}\n"
		sudo xbps-install xorg-minimal lxde-common lxde-icon-theme lxappearance lxinput lxpanel lxrandr lxsession lxtask \
			lxterminal pcmanfm gvfs gvfs-mtp gvfs-gphoto2 viewnior mousepad zathura zathura-pdf-poppler \
			openbox obconf xarchiver
		echo -e "\n${green}Done${none}\n"
		;;

		10 )
# Lumina
		echo -e "\n${blue}Install Lumina...${none}\n"
		sudo xbps-install xorg-minimal lumina lumina-pdf lumina-calculator gvfs gvfs-mtp gvfs-gphoto2 mousepad viewnior
		echo -e "\n${green}Done${none}\n"
		;;

	esac

	;;

# Window manager

	2 )
	echo -e "\n${blue}Install a Window Manager...${none}\n"
	printf "Possible (type in number): \n
	--- Xorg ---
	- 1 i3-gaps
	- 2 Openbox
	- 3 Fluxbox
	- 4 bspwm
	- 5 herbstluftwm
	- 6 IceWM
	- 7 awesome
	- 8 jwm
	- 9 dwm
	- 10 FVWM3
	- 11 Qtile
	--- Wayland ---
	- 12 Sway
	- 13 Wayfire\n"
	read -p "Which Window manager do you want? " windowmanager
	case $windowmanager in
		1 )
# i3-gaps
		echo -e "\n${blue}Install i3-gaps...${none}\n"
		sudo xbps-install xorg-minimal xorg-video-drivers xorg-input-drivers i3-gaps i3lock i3status i3blocks dunst dmenu feh Thunar \
			thunar-volman thunar-archive-plugin thunar-media-tags-plugin xarchiver \
			lm_sensors acpi playerctl scrot htop arandr gvfs gvfs-mtp \
			gvfs-gphoto2 xfce4-taskmanager viewnior
		echo -e "\n${green}Done${none}\n"
		;;

		2 )
# Openbox
		echo -e "\n${blue}Install Openbox...${none}\n"
		sudo xbps-install xorg-minimal xorg-video-drivers xorg-input-drivers openbox obconf lxappearance jgmenu dunst \
			feh lxrandr lxinput pcmanfm gvfs gvfs-mtp gvfs-gphoto2 \
			lxtask scrot htop xarchiver viewnior tint2conf obmenu-generator
		echo -e "\n${green}Done${none}\n"
		;;

		3 )
# Fluxbox
		echo -e "\n${blue}Install Fluxbox...${none}\n"
		sudo xbps-install xorg-minimal xorg-video-drivers xorg-input-drivers fluxbox dunst feh arandr Thunar thunar-volman \
		 thunar-archive-plugin thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 scrot htop xarchiver viewnior
		echo -e "\n${green}Done${none}\n"
		;;

		4 )
# Bspwm
		echo -e "\n${blue}Install Bspwm...${none}\n"
		sudo xbps-install xorg-minimal xorg-video-drivers xorg-input-drivers bspwm sxhkd dunst feh dmenu arandr Thunar thunar-volman \
			thunar-archive-plugin thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 scrot htop xarchiver viewnior
		echo -e "\n${green}Done${none}\n"
		;;

		5 )
# Herbsluftwm
		echo -e "\n${blue}Install herbstluftwm...${none}\n"
		sudo xbps-install xorg-minimal xorg-video-drivers xorg-input-drivers herbstluftwm dunst feh dmenu arandr Thunar thunar-volman \
			thunar-archive-plugin thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 scrot htop xarchiver viewnior
		echo -e "\n${green}Done${none}\n"
		;;

		6 )
# Icewm
		echo -e "\n${blue}Install IceWM...${none}\n"
		sudo xbps-install xorg-minimal xorg-video-drivers xorg-input-drivers icewm dunst feh dmenu arandr Thunar thunar-volman \
			thunar-archive-plugin thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 scrot htop xarchiver viewnior
		echo -e "\n${green}Done${none}\n"
		;;

		7 )
# Awesome
		echo -e "\n${blue}Install Awesome...${none}\n"
		sudo xbps-install xorg-minimal xorg-video-drivers xorg-input-drivers awesome vicious dunst feh arandr Thunar thunar-volman \
			thunar-archive-plugin thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 scrot \
			htop xarchiver viewnior
		echo -e "\n${green}Done${none}\n"
		;;

		8 )
# Jwm
		echo -e "\n${blue}Install jwm...${none}\n"
		sudo xbps-install xorg-minimal xorg-video-drivers xorg-input-drivers jwm dunst feh dmenu arandr Thunar thunar-volman \
			thunar-archive-plugin thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 scrot htop xarchiver viewnior
		echo -e "\n${green}Done${none}\n"
		;;

		9 )
# Dwm
		echo -e "\n${blue}Install dwm...${none}\n"
		sudo xbps-install xorg-minimal xorg-video-drivers xorg-input-drivers dwm dunst feh dmenu arandr Thunar thunar-volman \
			thunar-archive-plugin thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 scrot htop xarchiver viewnior
		echo -e "\n${green}Done${none}\n"
		;;

		10 )
# FVWM3
		echo -e "\n${blue}Install FVWM3...${none}\n"
		sudo xbps-install xorg-minimal xorg-video-drivers xorg-input-drivers fvwm3 feh arandr Thunar thunar-volman \
			thunar-archive-plugin thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 scrot htop xarchiver viewnior
		echo -e "\n${green}Done${none}\n"
		;;

		11 )
# Qtile
		echo -e "\n${blue}Install Qtile...${none}\n"
		sudo xbps-install python3 python3-pip python3-setuptools python3-wheel python3-virtualenv-clone python3-dbus \
			python3-gobject pango pango-devel libffi-devel xcb-util-cursor gdk-pixbuf
#		sudo xbps-install xorg-minimal xorg-video-drivers xorg-input-drivers feh arandr Thunar thunar-volman \
			thunar-archive-plugin thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 scrot htop xarchiver viewnior
		pip install qtile
		echo -e "\n${green}Done${none}\n"
		;;

		12 )
# Sway
		echo -e "\n${blue}Install Sway...${none}\n"
		sudo xbps-install wayland elogind dbus-elogind seatd sway swaybg swayidle swaylock azote grimshot Waybar \
		gvfs gvfs-mtp gvfs-gphoto2 htop wofi xf86-video-qxl mesa-dri
		echo -e "\n${green}Done${none}\n"
		;;

		13 )
# Wayfire
		echo -e "\n${blue}Install Wayfire...${none}\n"
		sudo xbps-install wayland wayfire grim gvfs gvfs-mtp gvfs-gphoto2 htop wofi mesa-dri
		echo -e "\n${green}Done${none}\n"
		;;

	esac

	;;

	3 )
# Xorg
	echo -e "\n${blue}Install the X Window System only...${none}\n"
	sudo xbps-install xorg-server xorg-server-xwayland xorg-video-drivers xorg-input-drivers \
		xinit xauth xrandr xrdb xwininfo xdpyinfo xsetroot neofetch
	echo -e "\n${blue}Copy configurations...${none}\n"
	if [ ! -d /etc/X11/xorg.conf.d ]; then
		sudo mkdir -p /etc/X11/xorg.conf.d
	fi
	echo -e "\n${green}Done${none}\n"
	;;

	4 )
# Wayland
	sudo xbps-install wayland
	;;

esac

# Install display manager

case $gui in
	2 )
	echo -e "\n${blue}Install a Display manageer...${none}\n"
	printf "Possible (type in number): \n
	- 1 Lightdm
	- 2 Emptty
	- 3 Slim\n"
	read -p "Which display manager do you want? " displaymanager
	case $displaymanager in
		1 )
		echo -e "\n${blue}Install Lightdm...${none}\n"
		sudo xbps-install lightdm lightdm-gtk3-greeter lightdm-gtk-greeter-settings
		echo -e "\n${green}Done${none}\n"
		;;

		2 )
		echo -e "\n${blue}Install Emptty...${none}\n"
		sudo xbps-install emptty
		echo -e "\n${green}Done${none}\n"
		;;

		3 )
		echo -e "\n${blue}Install Slim...${none}\n"
		sudo xbps-install slim slim-void-theme
		sudo cp conf.slim /etc/conf.slim
		echo -e "\n${green}Done${none}\n"
		;;

	esac

# Install a Terminal emulator

	echo -e "\n${blue}Install a Terminal emulator...${none}\n"
	printf "Possible (type in number): \n
	- 1 Alacritty
	- 2 xterm
	- 3 LXTerminal
	- 4 Yakuake
	- 5 Sakura
	- 6 Kitty\n"
	read -p "What terminal emulator do you want? " terminal
	case $terminal in
		1 )
		echo -e "\n${blue}Install Alacritty...${none}\n"
		sudo xbps-install alacritty alacritty-terminfo
		export TERMINAL="alacritty"
		printf TERM="alacritty" > ~/.bashrc
		term=alacritty
		echo -e "\n${green}Done${none}\n"
		;;

		2 )
		echo -e "\n${blue}Install xterm...${none}\n"
		sudo xbps-install xterm
		export TERMINAL="xterm"
		printf TERM="xterm" > ~/.bashrc
		term=xterm
		echo -e "\n${green}Done${none}\n"
		;;

		3 )
		echo -e "\n${blue}Install LXTerminal...${none}\n"
		sudo xbps-install lxterminal
		export TERMINAL="lxterminal"
		printf TERM="lxterminal" > ~/.bashrc
		term=lxterminal
		echo -e "\n${green}Done${none}\n"
		;;

		4 )
		echo -e "\n${blue}Install Yakuake...${none}\n"
		sudo xbps-install yakuake
		export TERMINAL="yakuake"
		printf TERM="yakuake" > ~/.bashrc
		term=yakuake
		echo -e "\n${green}Done${none}\n"
		;;

		5 )
		echo -e "\n${blue}Install Sakura...${none}\n"
		sudo xbps-install sakura
		export TERMINAL="sakura"
		printf TERM="sakura" > ~/.bashrc
		term=sakura
		echo -e "\n${green}Done${none}\n"
		;;

		6 )
		echo -e "\n${blue}Install Kitty...${none}\n"
		sudo xbps-install kitty kitty-terminfo
		export TERMINAL="kitty"
		printf TERM="kitty" > ~/.bashrc
		term=kitty
		echo -e "\n${green}Done${none}\n"
		;;

	esac

# Install terminal text editor

	echo -e "\n${blue}Choose terminal text editor...${none}\n"
	printf "Possible (type in number): \n
	- 1 Emacs
	- 2 Micro
	- 3 Nano
	- 4 Vim\n"
	read -p "Which terminal text editor do you want?" editor
	case $editor in
		1 )
		echo -e "\n${blue}Install Emacs...${none}\n"
		sudo xbps-install emacs
		;;

		2 )
		echo -e "\n${blue}Install Micro...${none}\n"
		sudo xbps-install micro
		;;

		3 )
		echo -e "\n${blue}Install Nano...${none}\n"
		sudo xbps-install nano
		;;

		4 )
		echo -e "\n${blue}Install Vim...${none}\n"
		sudo xbps-install vim vim-colorschemes
		;;

	esac

# Install GUI Text editor

	echo -e "\n${blue}Choose GUI text editor...${none}\n"
	printf "Possible (type in number): \n
	- 1 Geany
	- 2 Gedit
	- 3 Kate
	- 4 Sublime
	- 5 LeafPad
	- 6 Mousepad
	- 7 Atom
	- 8 Code-OSS
	- 9 Notepadqq
	- 10 Bluefish
	- 11 Emacs gtk2
	- 12 Emacs gtk3
	- 13 Emacs x11
	- 14 Qemacs
	- 15 Vile
	- 16 Zile
	- 17 Gvim
	- 18 Neovim
	- 19 Kakoune\n"
	read -p "Which GUI Text editor do you want?" geditor
	case $geditor in
		1 )
		echo -e "\n${blue}Install Geany...${none}\n"
		sudo xbps-install geany geany-plugins geany-plugins-extra
		;;

		2 )
		echo -e "\n${blue}Install Gedit...${none}\n"
		sudo xbps-install gedit gedit-plugins
		;;

		3 )
		echo -e "\n${blue}Install Kate...${none}\n"
		sudo xbps-install kate5
		;;

		4 )
		echo -e "\n${blue}Install Sublime...${none}\n"
		sudo xbps-install sublime-text3
		;;

		5 )
		echo -e "\n${blue}Install LeafPad...${none}\n"
		sudo xbps-install leafpad
		;;

		6 )
		echo -e "\n${blue}Install Mousepad...${none}\n"
		sudo xbps-install mousepad
		;;

		7 )
		echo -e "\n${blue}Install Atom...${none}\n"
		sudo xbps-install atom
		;;

		8 )
		echo -e "\n${blue}Install Code-OSS...${none}\n"
		sudo xbps-install vscode
		;;

		9 )
		echo -e "\n${blue}Install Notepadqq...${none}\n"
		sudo xbps-install notepadqq
		;;

		10 )
		echo -e "\n${blue}Install Bluefish...${none}\n"
		sudo xbps-install bluefish
		;;

		11 )
		echo -e "\n${blue}Install Emacs gtk2...${none}\n"
		sudo xbps-install emacs-gtk2
		;;

		12 )
		echo -e "\n${blue}Install Emacs gtk3...${none}\n"
		sudo xbps-install emacs-gtk3
		;;

		13 )
		echo -e "\n${blue}Install Emacs x11...${none}\n"
		sudo xbps-install emacs-x11
		;;

		14 )
		echo -e "\n${blue}Install Qemacs...${none}\n"
		sudo xbps-install qemacs
		;;

		15 )
		echo -e "\n${blue}Install Vile...${none}\n"
		sudo xbps-install vile
		;;

		16 )
		echo -e "\n${blue}Install Zile...${none}\n"
		sudo xbps-install zile
		;;

		17 )
		echo -e "\n${blue}Install Gvim...${none}\n"
		sudo xbps-install gvim
		;;

		18 )
		echo -e "\n${blue}Install Neovim...${none}\n"
		sudo xbps-install neovim
		;;

		19 )
		echo -e "\n${blue}Install Kakoune...${none}\n"
		sudo xbps-install kakoune
		;;

	esac

# Install an Internet browser

	echo -e "\n${blue}Install an Internet browser...${none}\n"
	printf "Possible (type in number): \n
	- 1 Firefox
	- 2 Firefox-ESR
	- 3 Chromium
	- 4 qutebrowser
	- 5 Falkon
	- 6 Badwolf\n"
	read -p "Which browser do you want? " browser
	case $browser in
		1 )
		echo -e "\n${blue}Install Firefox...${none}\n"
		sudo xbps-install firefox firefox-i18n-en-US firefox-i18n-de
		echo -e "\n${green}Done${none}\n"
		;;

		2 )
		echo -e "\n${blue}Install Firefox Extended Support Release...${none}\n"
		sudo xbps-install firefox-esr firefox-esr-i18n-en-US firefox-esr-i18n-de
		echo -e "\n${green}Done${none}\n"
		;;

		3 )
		echo -e "\n${blue}Install Chromium...${none}\n"
		sudo xbps-install chromium
		echo -e "\n${green}Done${none}\n"
		;;

		4 )
		echo -e "\n${blue}Install qutebrowser...${none}\n"
		sudo xbps-install qutebrowser
		echo -e "\n${green}Done${none}\n"
		;;

		5 )
		echo -e "\n${blue}Install Falkon...${none}\n"
		sudo xbps-install falkon
		echo -e "\n${green}Done${none}\n"
		;;

		6 )
		echo -e "\n${blue}Install Badwolf...${none}\n"
		sudo xbps-install badwolf
		echo -e "\n${green}Done${none}\n"
		;;

	esac

# Install a media player

	echo -e "\n${blue}Install a Video player...${none}\n"
	printf "Possible (type in number): \n
	- 1 mpv
	- 2 VLC Media Player
	- 3 Parole (part of Xfce)
	- 4 Totem (part of GNOME)\n"
	read -p "Which Video player do you want? " mediaplayer
	case $mediaplayer in
		1 )
		echo -e "\n${blue}Install mpv...${none}\n"
		sudo xbps-install mpv
		echo -e "\n${green}Done${none}\n"
		;;

		2 )
		echo -e "\n${blue}Install VLC Media Player...${none}\n"
		sudo xbps-install vlc
		echo -e "\n${green}Done${none}\n"
		;;

		3 )
		echo -e "\n${blue}Install Parole...${none}\n"
		sudo xbps-install parole
		echo -e "\n${green}Done${none}\n"
		;;

		4 )
		echo -e "\n${blue}Install Totem...${none}\n"
		sudo xbps-install totem
		echo -e "\n${green}Done${none}\n"
		;;

	esac
	;;

esac

# Install fonts

	read -p "Do you want to install some fonts? (y) " fonts
	case $fonts in
		y )
		echo -e "\n${blue}Install fonts...${none}\n"
		sudo xbps-install liberation-fonts-ttf dejavu-fonts-ttf \
			ttf-ubuntu-font-family fonts-roboto-ttf
		echo -e "\n${green}Done${none}\n"
		;;

	esac


# Install LibreOffice

read -p "Do you want to install LibreOffice? (y) " libreoffice
case $libreoffice in
	y )
	echo -e "\n${blue}Install LibreOffice...${none}\n"
	sudo xbps-install libreoffice-writer libreoffice-calc libreoffice-impress \
		libreoffice-draw libreoffice-math libreoffice-base libreoffice-gnome \
		libreoffice-i18n-en-US libreoffice-i18n-de
	echo -e "\n${green}Done${none}\n"
	;;

esac

# Install GIMP + Inkscape

read -p "Do you want to install GIMP and Inkscape? (y) " gimpinkscape
case $gimpinkscape in
	y )
	echo -e "\n${blue}Install GIMP and Inkscape...${none}\n"
	sudo xbps-install inkscape gimp
	echo -e "\n${green}Done${none}\n"
	;;

esac

# Install QEMU + Virt Manager

read -p "Do you want to install QEMU and Virt Manager? (y) " qemuvirt
case $qemuvirt in
	y )
	echo -e "\n${blue}Install QEMU and Virt Manager...${none}\n"
	sudo xbps-install qemu virt-manager libvirt
	echo -e "\n${blue}Enable libvirtd service...${none}\n"
	if [ -L /var/service/libvirtd ]; then
		echo -e "\n${green}Service libvirtd already exist. Continue.${none}\n"
	else
		sudo ln -sv /etc/sv/libvirtd /var/service
		echo -e "\n${green}Done${none}\n"
	fi
	;;

esac

# Install a Backup program
echo -e "\n${blue}Install a Backup program...${none}\n"
printf "Possible (type in number): \n
- 1 Borg
- 2 Timeshift
- 3 Deja-dup\n"
read -p "Which Backup program do you want? " backup
case $backup in
	1 )
	echo -e "\n${blue}Install Borg...${none}\n"
	sudo xbps-install borg
	echo -e "\n${green}Done${none}\n"
	;;

	2 )
	echo -e "\n${blue}Install Timeshift...${none}\n"
	sudo xbps-install timeshift
	echo -e "\n${green}Done${none}\n"
	;;

	3 )
	echo -e "\n${blue}Install Deja-dup...${none}\n"
	sudo xbps-install deja-dup
	echo -e "\n${green}Done${none}\n"
	;;

	esac

# Choose X keyboard language

	echo -e "\n${blue}Change X keyboard language...${none}\n"
	printf "Possible (type in number)or Enter for English: \n
	- 1 Czech
	- 2 Deutsch
	- 3 French
	- 4 Russian
	- 5 Spanish\n"
	echo -n "$blue"
	read -p "Which keyboard layout do you want? " xlanguage
	echo -n "$none"
	case $xlanguage in
		1 )
			if [ ! -d /etc/X11/xorg.conf.d ]; then
				sudo mkdir -p /etc/X11/xorg.conf.d
			fi
			sed "s/"cs"/"cz"/" conf.keyboard > 00-keyboard.conf
			sudo cp -r 00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf
			sudo cp -r conf.touchpad /etc/X11/xorg.conf.d/20-touchpad.conf
			echo -e "\n${green}Done${none}\n"
			;;

		2 )
			if [ ! -d /etc/X11/xorg.conf.d ]; then
				sudo mkdir -p /etc/X11/xorg.conf.d
			fi
			sed "s/"cs"/"de"/" conf.keyboard > 00-keyboard.conf
			sudo cp -r 00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf
			sudo cp -r conf.touchpad /etc/X11/xorg.conf.d/20-touchpad.conf
			echo -e "\n${green}Done${none}\n"
			;;

		3 )
			if [ ! -d /etc/X11/xorg.conf.d ]; then
				sudo mkdir -p /etc/X11/xorg.conf.d
			fi
			sed "s/"cs"/"fr"/" conf.keyboard > 00-keyboard.conf
			sudo cp -r 00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf
			sudo cp -r conf.touchpad /etc/X11/xorg.conf.d/20-touchpad.conf
			echo -e "\n${green}Done${none}\n"
			;;

		4 )
			if [ ! -d /etc/X11/xorg.conf.d ]; then
				sudo mkdir -p /etc/X11/xorg.conf.d
			fi
			sed "s/"cs"/"ru"/" conf.keyboard > 00-keyboard.conf
			sudo cp -r 00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf
			sudo cp -r conf.touchpad /etc/X11/xorg.conf.d/20-touchpad.conf
			echo -e "\n${green}Done${none}\n"
			;;


		5 )
			if [ ! -d /etc/X11/xorg.conf.d ]; then
				sudo mkdir -p /etc/X11/xorg.conf.d
			fi
			sed "s/"cs"/"es"/" conf.keyboard > 00-keyboard.conf
			sudo cp -r 00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf
			sudo cp -r conf.touchpad /etc/X11/xorg.conf.d/20-touchpad.conf
			echo -e "\n${green}Done${none}\n"
			;;


		* )
			if [ ! -d /etc/X11/xorg.conf.d ]; then
				sudo mkdir -p /etc/X11/xorg.conf.d
			fi
			sed "s/"cs"/"us"/" conf.keyboard > 00-keyboard.conf
			sudo cp -r 00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf
			sudo cp -r conf.touchpad /etc/X11/xorg.conf.d/20-touchpad.conf
			echo -e "\n${green}Done${none}\n"
			;;
		esac

# Enable required services

echo -e "\n${blue}Enable required services..."
echo "Enable D-Bus...${none}\n"
sudo xbps-install -y dbus
if [ -L /var/service/dbus ]; then
	echo -e "\n${green}Service dbus already exist. Continue.${none}\n"
else
	sudo ln -s /etc/sv/dbus /var/service
	echo -e "\n${green}Done${none}\n"
fi
	echo -e "\n${blue}Enable elogind...${none}\n"
	sudo xbps-install -y elogind
if [ -L /var/service/elogind ]; then
	echo -e "\n${green}Service elogind already exist. Continue.${none}\n"
else
	sudo ln -s /etc/sv/elogind /var/service
	echo -e "\n${green}Done${none}\n"
fi
	echo -e "\n${blue}Enable Polkit...${none}\n"
if [ -L /var/service/polkitd ]; then
	echo -e "\n${green}Service polkitd already exist. Continue.${none}\n"
else
	sudo ln -s /etc/sv/polkitd /var/service
	echo -e "\n${green}Done${none}\n"
fi

# Configure Cron

echo -e "\n${blue}Install cronie...${none}\n"
sudo xbps-install -y cronie
echo -e "\n${blue}Enable cronie service...${none}\n"
if [ -L /var/service/cronie ]; then
	echo -e "\n${green}Service cronie already exist. Continue.${none}\n"
else
	sudo ln -sv /etc/sv/cronie /var/service
	echo -e "\n${green}Done${none}\n"
fi

# Configure Audio

read -p "Do you want to install PulseAudio for audio? (y) " pulseaudio
case $pulseaudio in
	y )
	echo -e "\n${blue}Install PulseAudio...${none}\n"
	sudo xbps-install pulseaudio pulseaudio-utils pulsemixer alsa-plugins-pulseaudio \
		pavucontrol
	echo -e "\n${green}Done${none}\n"
	;;

esac

# Configure Network Management

echo -e "\n${blue}Configure Network Management...${none}\n"
printf "\nPossible (type in number): \n
- 1 Network Manager
- 2 Connman\n"
read -p "Which Network Management tool do you want to use? " netmngt
case $netmngt in
	1 )
	echo -e "\n${blue}Install Network Manager...${none}\n"
	sudo xbps-install NetworkManager NetworkManager-openvpn NetworkManager-openconnect \
		NetworkManager-vpnc NetworkManager-l2tp
	read -p "Do you want to integrate Network Manager into a graphical environment? (y) " nmapplet
	case $nmapplet in
		y )
		echo -e "\n${blue}Service Install Network Manager applet...${none}\n"
		sudo xbps-install network-manager-applet
		;;

	esac

	echo -e "\n${blue}Enable Network Manager service...${none}\n"
	if [ -L /var/service/NetworkManager ]; then
		echo -e "\n${green}Service NetworkManager already exist. Continue.${none}\n"
	else
		sudo ln -sv /etc/sv/NetworkManager /var/service
		echo -e "\n${green}Done${none}\n"
	fi
	;;

	2 )
	echo -e "\n${blue}Install Connman...${none}\n"
	sudo xbps-install connman connman-ncurses
	read -p "Do you want to integrate Connman into a graphical environment? (y) " connapplet
	case $connapplet in
		y )
		echo -e "\n${blue}Service Install Connman GTK...${none}\n"
		sudo xbps-install connman-ui
		;;

	esac

	echo -e "\n${blue}Enable Connman service...${none}\n"
	if [ -L /var/service/connmand ]; then
		echo -e "\n${green}Service connmand already exist. Continue.${none}\n"
	else
		sudo ln -sv /etc/sv/connmand /var/service
		echo -e "\n${green}Done${none}\n"
	fi
	;;

esac

# Configure Bluetooth

read -p "Do you want to use Bluetooth? (y) " bluetooth
case $bluetooth in
	y )
	echo -e "\n${blue}Install BlueZ...${none}\n"
	sudo xbps-install bluez
	printf "\n"
	read -p "Do you want to integrate Bluetooth into a graphical environment? (y) " blueman
	case $blueman in
		y )
		echo -e "\n${blue}Install Blueman...${none}\n"
		sudo xbps-install blueman
		;;

	esac

	echo -e "\n${blue}Enable Bluetooth service...${none}\n"
	if [ -L /var/service/bluetoothd ]; then
		echo -e "\n${green}Service bluetoothd already exist. Continue.${none}\n"
	else
		sudo ln -sv /etc/sv/bluetoothd /var/service
		echo -e "\n${green}Done${none}\n"
	fi
	;;

esac

# Configure Printing support

read -p "Do you want to use printers? (y) " printer
case $printer in
	y )
	echo -e "\n${blue}Install CUPS and Tools...${none}\n"
	sudo xbps-install cups cups-pk-helper cups-filters foomatic-db foomatic-db-engine
	read -p "Do you want to install a graphical printer program? (y) " printergui
	case $printergui in
		y )
		echo -e "\n${blue}Install system-config-printer...${none}\n"
		sudo xbps-install system-config-printer
		;;

	esac

	echo -e "\n${blue}Enable CUPS service...${none}\n"
	if [ -L /var/service/cupsd ]; then
		echo -e "\n${green}Service cupsd already exist. Continue.${none}\n"
	else
		sudo ln -sv /etc/sv/cupsd /var/service
		echo -e "\n${green}Done${none}\n"
	fi
	;;

esac

# Configure Notebook Power Saving

read -p "Do you want to install TLP for power saving (Notebooks only)? (y) " nb_power
case $nb_power in
	y )
	echo -e "\n${blue}Install TLP and PowerTop...${none}\n"
	sudo xbps-install tlp tlp-rdw powertop
	echo -e "\n${blue}Enable TLP service...${none}\n"
	if [ -L /var/service/tlp ]; then
		echo -e "\n${green}Service tlp already exist. Continue.${none}\n"
	else
		sudo ln -sv /etc/sv/tlp /var/service
		echo -e "\n${green}Done${none}\n"
	fi
	;;

esac

# Configure Filesharing

read -p "Do you want to install NFS for file sharing? (y) " pulseaudio
case $pulseaudio in
	y )
	echo -e "\n${blue}Install NFS...${none}\n"
	sudo xbps-install nfs-utils sv-netmount
	sudo ln -s /etc/sv/statd /var/service/
	sudo ln -s /etc/sv/rcpbind /var/service/
	sudo ln -s /etc/sv/netmount /var/service/
	echo -e "\n${green}Done${none}\n"
	;;

esac


# Configure the window manager

read -p "Do you want to configure your Window Manager? (y) " confwm
case $confwm in
	y )
	echo -e "\n${blue}Will be configured just for your user...${none}\n"
	 case $windowmanager in
		1 )
# i3-gaps
		echo -e "\n${blue}Configuring i3-gaps...${none}\n"
		echo -e "\n${green}Done${none}\n"
		;;

		2 )
# Openbox
		echo -e "\n${blue}Configuring Openbox...${none}\n"
		obmenu-generator -p -i -u -d -c
		echo -e "\n${green}Done${none}\n"
		;;

		3 )
# Fluxbox
		echo -e "\n${blue}Configuring Fluxbox...${none}\n"
		echo -e "\n${green}Done${none}\n"
		;;

		4 )
# Bspwm
		echo -e "\n${blue}Configuring Bspwm...${none}\n"
		echo -e "\n${green}Done${none}\n"
		;;

		5 )
# Herbsluftwm
		echo -e "\n${blue}Configuring herbstluftwm...${none}\n"
		echo -e "\n${green}Done${none}\n"
		;;

		6 )
# Icewm
		echo -e "\n${blue}Configuring IceWM...${none}\n"
		echo -e "\n${green}Done${none}\n"
		;;

		7 )
# Awesome
		echo -e "\n${blue}Configuring Awesome...${none}\n"
		mkdir ~/.config/awesome
		sed "s/"xterm"/"$term"/" /etc/xdg/awesome/rc.lua > ~/.config/awesome/rc.lua
		echo -e "\n${green}Done${none}\n"
		;;

		8 )
# Jwm
		echo -e "\n${blue}Configuring jwm...${none}\n"
		echo -e "\n${green}Done${none}\n"
		;;

		9 )
# Dwm
		echo -e "\n${blue}Configuring dwm...${none}\n"
		echo -e "\n${green}Done${none}\n"
		;;

		10 )
# FVWM3
		echo -e "\n${blue}Configuring FVWM3...${none}\n"
		echo -e "\n${green}Done${none}\n"
		;;

		11 )
# Qtile
		echo -e "\n${blue}Configuring Qtile...${none}\n"
		echo -e "\n${green}Done${none}\n"
		;;

		12 )
# Sway
		echo -e "\n${blue}Configuring Sway...${none}\n"
		sudo ln -s /etc/sv/seatd /var/service
		usermod -aG _seatd "$USER"
		echo -e "\n${green}Done${none}\n"
		;;

		13 )
# Wayfire
		echo -e "\n${blue}Configuring Wayfire...${none}\n"
		echo -e "\n${green}Done${none}\n"
		;;

	esac

	;;

esac

# Configure the Display manager

read -p "Check if a display manager exist. If yes, enable it? (y) " dmenable
case $dmenable in
	y )
	if [ -f /usr/bin/lightdm ]; then
		sudo ln -sv /etc/sv/lightdm /var/service
	elif [ -f /usr/bin/sddm ]; then
		sudo ln -sv /etc/sv/sddm /var/service
	elif [ -f /usr/bin/gdm ]; then
		sudo ln -sv /etc/sv/gdm /var/service
	elif [ -f /usr/bin/slim ]; then
		sudo ln -sv /etc/sv/slim /var/service
	elif [ -f /usr/bin/emptty ]; then
		sudo ln -sv /etc/sv/emptty /var/service
	fi
	;;

esac

echo -e "\n${red}Installation finished. Enjoy Void linux...${none}\n"
