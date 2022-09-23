#!/bin/bash
echo INICIAR CON CABLE DE RED CONECTADO

echo Instalación de Home Asssistant con Docker y Portainer

echo en Raspberry Pi 4

sleep 5s

echo Se va a proceder a actualizar

echo el sistema Raspberry Pi 4

sudo apt update 
sudo apt upgrade

echo Actualizacion finalizada

sleep 3s

sudo apt-get install \
jq \
wget \
curl \
udisks2 \
libglib2.0-bin \
network-manager \
apparmor \
apt-transport-https \
ca-certificates \
dbus -y

curl -fsSL https://get.docker.com -o get-docker.sh

sh get-docker.sh

sudo usermod -aG docker $USER

echo Docker Instalado

sleep 3s

echo Se va a instalar 

echo HOME ASISSTANT SUPERVISED

sudo wget https://github.com/home-assistant/os-agent/releases/download/1.3.0/os-agent_1.3.0_linux_armv7.deb

sudo dpkg -i os-agent_1.3.0_linux_armv7.deb

sudo gdbus introspect --system --dest io.hass.os --object-path /io/hass/os

sudo wget https://github.com/home-assistant/supervised-installer/releases/latest/download/homeassistant-supervised.deb

sleep 2s

echo RECUERDA TENER CONECTADO EL CABLE DE RED

echo TIENES 5 SEGUNDOS

sleep 5s

sudo dpkg -i homeassistant-supervised.deb

sleep 3s

sudo docker volume create portainer_data

sudo docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer

echo Portainter instalado
