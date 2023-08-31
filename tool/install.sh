#!/bin/bash
set -e

setup_font(){
	sudo apt install fonts-noto-cjk fonts-noto-color-emoji fonts-jetbrains-mono -y
	gsettings set org.gnome.desktop.interface font-name 'Noto Sans CJK SC 13'
	gsettings set org.gnome.desktop.interface document-font-name 'Noto Sans CJK SC 13'
	gsettings set org.gnome.desktop.interface monospace-font-name 'JetBrains Mono 13'
	gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Noto Sans CJK SC Medium 13'
}

setup_theme(){
	sudo apt install materia-gtk-theme -y
	gsettings set org.gnome.desktop.interface gtk-theme Materia-compact
}

setup_icon(){
	cd /tmp
	wget -c https://cdn.jsdelivr.net/gh/edgist/starter/source/icon -O - | wget -i - -O Tela-icon-theme.zip
	unzip Tela* && cd Tela*/
	./install.sh 
	gsettings set org.gnome.desktop.interface icon-theme Tela-dark
}

other(){
	gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'
}

main(){
	sudo apt update -qq
	setup_font
	setup_theme
	setup_icon
	other
}

main 
