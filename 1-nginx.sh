#!/bin/bash

Negrita="\e[1m"
ROJO="\e[;31m"
Negro="\e[39m"
echo -e "Escriba el nombre de imagen a descargar ${Negrita}imagen:version"
echo -e ${ROJO}"Si no conoce la versión escriba solo el nombre" ${Negro}
read image
echo -e ${Negro}"descargando $image"
docker pull $image 
echo "descargado"
