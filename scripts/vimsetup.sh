#!/bin/bash
echo "Script hecho para distribuciones basadas en Ubuntu / Debian y derivados"
echo "Se van a instalar las fuentes necesarias para los caracteres de la barra de estado. ¿Quieres continuar?(S/N)"

echo "Es necesario para que funcione que previamente hayas copiado el .vimrc a tu directorio HOME / ~"
sleep 1
echo "Tendrás que ejecutar, dentro de VIM y en modo normal (no editando) lo siguiente:"
sleep 1
echo ":PlugInstall , después de esto le das a Enter y verás a la derecha la instalación de plugins en marcha."
sleep 1
echo "Para elegir un tema, el comando, en el mismo sitio que el anterior, es :AirlineTheme <nombre de tema>. Puedes usar el tabulador para circular por las opciones."
