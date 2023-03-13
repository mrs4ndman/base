#!/bin/bash
#Válido para PopOS, debería funcionar en Ubuntu, Debian y derivativos
#Incluye mis herramientas de uso común del terminal, recomiendo ir por GitHub.com a ver lo que hacen, si no las conoces claro ;)

echo "\e[1mAVISO\e[0m : Vas a arrancar el script de instalación. \e[1mQuieres continuar? (S/N)\e[0m"
read answer
sleep 2
if [ "$answer" = "S" ] || [ "$answer" = "s" ]; then

sudo apt update
sudo apt install -y thefuck \
tldr \
bashtop \
tree \
nyancat \
lolcat \
speedtest-cli \
neofetch \
smartmontools \
lshw \
tree \
vim \
ufw \
gufw \
neovim \
git \
curl \
wget \
tmux \
cmatrix \
net-tools \
python3 \
python3-dev \
python3-pip \
python3-setuptools 2> errors.txt && tldr -u 2>&1

echo -e "Ya se han instalado las utilidades. Comprueba los errores ejecutando \e[3mcat errors.txt\e[0m"
/bin/bash neofetch
echo "No he roto nada, puedes hacer un cat de este archivo (el .sh que te has descargado) para ver lo que pasa. Si quieres revertirlo, usa el script de desinstalación ;)"
echo "Si tldr no funciona, ejecutar el comando tldr -u para crear la base de datos de resúmenes de comandos"
echo "Para que la utilidad \e[3mthefuck\e[0m funcione, hay que añadir manualmente lo siguiente: eval \$(thefuck --alias)"
else
  echo "Abortando..."
  exit 0
fi
