#!/bin/bash

reset_font(){
	gsettings reset org.gnome.desktop.interface font-name 
	gsettings reset org.gnome.desktop.interface document-font-name 
	gsettings reset org.gnome.desktop.interface monospace-font-name 
	gsettings reset org.gnome.desktop.wm.preferences titlebar-font
	sudo rm -rv /usr/share/fonts/NotoSansCJKsc /usr/share/fonts/NotoSerifCJKsc /usr/share/fonts/JetBrainsMono /etc/fonts/conf.d/64-language-selector-prefer.conf
	fc-cache -fv
}

reset_theme(){
	gsettings reset org.gnome.desktop.interface gtk-theme 
	sudo apt purge arc-theme -y
}

reset_icon(){
	gsettings reset org.gnome.desktop.interface icon-theme
	rm -rf $HOME/.local/share/icons/Tela*
}

main(){
	reset_font
	reset_theme
	reset_icon
}

main	
