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
#Fuente que uso yo en mi terminal: Droid Sans Mono de Nerd Font o Powerline.

# clonamos el repositorio de fuentes
wget https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf && 
sudo cp Droid\ Sans\ Mono\ Nerd\ Font\ Complete.otf /usr/share/fonts/

