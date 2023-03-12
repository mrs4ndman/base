#!/bin/bash
#Válido para PopOS, Ubuntu, Debian y derivativos
#Incluye mis herramientas de uso común del terminal, recomiendo ir por GitHub.com a ver lo que hacen, si no las conoces claro ;)

#!/bin/bash

echo "\e[1mAVISO\e[0m : Vas a arrancar el script de instalación. \e[1mQuieres continuar? (S/N)\e[0m"
read answer
sleep 2
if [ "$answer" = "S" ] || [ "$answer" = "s" ]; then

sudo apt update && \
sudo apt install -y thefuck tldr nyancat lolcat speedtest-cli neofetch lshw vim neovim git curl wget 2> errors.txt  && tldr -u 2>&1

echo -e "Ya se han instalado las utilidades. Comprueba los errores ejecutando \e[3mcat errors.txt\e[0m"
/bin/bash neofetch
echo "No he roto nada, puedes hacer un cat de este archivo (el .sh que te has descargado) para ver lo que pasa. Si quieres revertirlo, usa el script de desinstalación ;)"
else
  echo "Abortando..."
  exit 0
fi
