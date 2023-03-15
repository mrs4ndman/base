#!/bin/sh

#Setup script for GUI apps that I use on my setup | Script para mis apps de uso común de tipo GUI
echo "Instalación de 1 sola vez: -v = KVM setup, -s = Spotify, -c = VSCodium (VSCode liberado), -p = programas"
# Definimos el selector de script
instalar() {
    echo "Instalar: $0 [-a] [-b] [-c]"
    echo "-v: Instalación QEMU/KVM y Virt-manager"
    echo "-s: Instalación Spotify"
    echo "-c: Instalación programas corrientes"
}

# Parseado de los argumentos introducidos
while getopts "vspc" opt; do
    case ${opt} in
        v ) v_flag=true ;;
        s ) s_flag=true ;;
        p ) p_flag=true ;;
        c ) c_flag=true ;;
	* ) usage; exit 1 ;;
    esac
done

# Ejecuta los if statements en función de las opciones invocadas

#Flag e instalación de KVM / Libvirt como entorno de virtualización:

if [ "$v_flag" = true ]; then
    echo "Instalando entorno de virtualización:"

	echo "\e[1mAVISO\e[0m : Vas a arrancar el script de apps. \e[1mQuieres continuar? (S/N)\e[0m"
	read -r answer
	sleep 1
	if [ "$answer" = "S" ] || [ "$answer" = "s" ]; then



	sudo apt update && sudo apt install qemu-kvm \
	libvirt-daemon-system \
	libvirt-clients \
	bridge-utils \
	virt-manager &&

	kvm-ok

	sudo adduser "$USER" libvirt;
	sudo adduser "$USER" kvm;

	sudo systemctl enable libvirtd;
	sudo systemctl start libvirtd;

	sudo systemctl status libvirtd;
	echo "Necesario reiniciar para arrancar la virtualización"
	sleep 5

	else
        	echo "Cancelando | Cancelling ..."
        	exit 0
	fi


fi

#Flag e instalación de Spotify

if [ "$s_flag" = true ]; then
    
echo "Comenzando instalación de Spotify. ¿Quieres continuar?(S/N)"

	read -r answer
        sleep 1
        if [ "$answer" = "S" ] || [ "$answer" = "s" ]; then

		curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg &&

		echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list;

		sudo apt update && sudo apt install spotify-client

   	echo "Buscar después en el menú de aplicaciones"
        sleep 5

        else
                echo "Cancelando | Cancelling ..."
                exit 0
        fi

fi

#Flag e instalación de mis programas comunes

if [ "$p_flag" = true ]; then

	sudo apt update && sudo apt install -y discord \
	flameshot \
	gparted \
	psensor \
	gnome-tweaks \
	tilix \
	gufw \
	keepassxc \
	steam \
	smplayer

fi


if [ "$c_flag" = true ]; then

	echo "Instalando VSCodium"
	sleep 3

	wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg     | gpg --dearmor     | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg &&

	echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main'     | sudo tee /etc/apt/sources.list.d/vscodium.list &&

	sudo apt update && sudo apt install -y codium
	
fi



# Final del script, enhorabuena :) 
exit 0



