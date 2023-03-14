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
cp -R /usr/share/powerline/config_files/* \
	$HOME/.config/powerline/

powerline-daemon --replace

echo "Añadir \"args\": { \"status_colors\": \true } a la parte 
de .vcs.branch de .config/powerline/themes/shell/default_leftonly.json"
#Luego hay que ejecutar source $HOME/.bashrc para finalizar los cambios.
#Fuente a usar en terminal por defecto: Droid Sans Mono for Powerline

# clonamos el repositorio de fuentes
git clone https://github.com/powerline/fonts.git --depth=1
# instalamos
cd fonts
./install.sh
# limpiamos un poquito las cosas
cd ..
rm -rf fonts

