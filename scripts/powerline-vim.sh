#!/bin/bash
#Probado con PopOS (y su terminal por defecto), Tilix y VIM 
sudo add-apt-repository universe
sudo apt install -y powerline fonts-powerline python3 python3-pip python3-setuptools

echo "
if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
	powerline-daemon -q
	POWERLINE_BASH_CONTINUATION=1
	POWERLINE_BASH_SELECT=1
	source /usr/share/powerline/bindings/bash/powerline.sh
fi">> $HOME/.bashrc

echo "
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

set laststatus=2">> $HOME/.vimrc

mkdir -p $HOME/.config/powerline
cp -R /usr/share/pwoerline/config_files/* \
	$HOME/.config/powerline/

powerline-daemon --replace

#Añadir "args": { "status_colors": true }
#Luego hay que ejecutar source $HOME/.bashrc para finalizar los cambios.
#Fuente a usar en terminal por defecto: Droid Sans Mono for Powerline

