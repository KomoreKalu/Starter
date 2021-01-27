#!/bin/bash
set -e

setup_font(){
	cd /tmp
	wget -c https://cdn.jsdelivr.net/gh/KomoreKalu/starter/source/font -O - | wget -c -i -
	sudo unzip NotoSans* -d /usr/share/fonts/NotoSansCJKsc
	sudo unzip NotoSerif* -d /usr/share/fonts/NotoSerifCJKsc
	sudo unzip JetBrains* -d /usr/share/fonts/JetBrainsMono
	cd /usr/share/fonts/
	sudo chmod -R 755 Noto* JetBrainsMono
	cd NotoSansCJKsc && sudo mkfontdir && sudo mkfontscale && cd ..
	cd NotoSerifCJKsc && sudo mkfontdir && sudo mkfontscale && cd ..
	cd JetBrainsMono && sudo mkfontdir && sudo mkfontscale && cd ..
	sudo sh -c 'https://cdn.jsdelivr.net/gh/KomoreKalu/starter/config/font.conf -O - | cat - > /etc/fonts/conf.d/64-language-selector-prefer.conf'
	fc-cache -fv
	gsettings set org.gnome.desktop.interface font-name 'Noto Sans CJK SC 13'
	gsettings set org.gnome.desktop.interface document-font-name 'Noto Sans CJK SC 13'
	gsettings set org.gnome.desktop.interface monospace-font-name 'JetBrains Mono 13'
	gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Noto Sans CJK SC Medium 13'
}

setup_theme(){
	sudo apt install arc-theme -y
	gsettings set org.gnome.desktop.interface gtk-theme Arc-Darker
}

setup_icon(){
	cd /tmp
	wget -c https://cdn.jsdelivr.net/gh/KomoreKalu/starter/source/icon -O - | wget -i - -O Tela-icon-theme.zip
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
