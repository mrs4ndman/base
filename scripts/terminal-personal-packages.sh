#!/bin/bash
#Válido para PopOS, Ubuntu, Debian y derivativos
sudo apt update && \
sudo apt install -y thefuck tldr nyancat lolcat speedtest-cli neofetch lshw vim neovim git curl wget 2> errors.txt  && tldr -u 2>&1 

echo "Ya se han instalado las utilidades. Comprueba los errores ejecutando cat errors.txt"
/bin/bash neofetch
