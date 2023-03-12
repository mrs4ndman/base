#!/bin/bash
#Desinstalador que revierte lo hecho en terminal-personal-packages.sh
echo "\e[1mAVISO\e[0m : Vas a arrancar el script de desinstalación. \e[1mQuieres continuar y desinstalar? (S/N)\e[0m"
read answer
echo "Todavía estás a tiempo de cancelar, 5 segundos. Te pedirá confirmación para que elijas las que quieres quitar."
sleep 5

if ["$answer" = "S" ] || [ "$answer" = "s" ]; then

sudo apt remove thefuck bashtop tldr nyancat lolcat speedtest-cli neofetch lshw vim neovim cmatrix

echo "Ya se han desinstalado las utilidades."

echo "Si has desinstalado alguna aplicación que utilizabas antes, puedes comprobar el otro script e instalarla de nuevo con apt."

else
  echo "Abortando..."
  sleep 1
  exit 0
fi
