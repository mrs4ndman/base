#!/bin/bash
#Probado con PopOS (y su terminal por defecto), Tilix y VIM
#Técnicamente compatible con Ubuntu / Debian y derivados. Ejecutar con bash o haciendo chmod 750 powerline-vim.sh y llamando al archivo.
sudo apt install -y powerline fonts-powerline

echo "
if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
	powerline-daemon -q
	POWERLINE_BASH_CONTINUATION=1
	POWERLINE_BASH_SELECT=1
	source /usr/share/powerline/bindings/bash/powerline.sh
fi">> $HOME/.bashrc

mkdir -p $HOME/.config/powerline
cp -R /usr/share/powerline/config_files/* \
	$HOME/.config/powerline/

powerline-daemon --replace

echo "Añadir \"args\": { \"status_colors\": \true } a la parte 
de .vcs.branch de .config/powerline/themes/shell/default_leftonly.json"
#Luego hay que ejecutar source $HOME/.bashrc para finalizar los cambios.
#Fuente que uso yo en mi terminal: Droid Sans Mono for Powerline

# clonamos el repositorio de fuentes
git clone https://github.com/powerline/fonts.git --depth=1
# instalamos
cd fonts
./install.sh
# limpiamos un poquito las cosas
cd ..
rm -rf fonts
./install.sh
# limpiamos un poquito las cosas
cd ..
rm -rf fonts

