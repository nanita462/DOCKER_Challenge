#!/bin/bash

echo "Creando servidor Nginx"
docker run --name bootcamp-web -p 9999:80 -d nginx:1.22.1
echo "copiando web/index.html bootcamp-web/index.html"
docker cp web/* bootcamp-web:/usr/share/nginx/html/index.html
echo "entrando al contenedor"
docker exec bootcamp-web bash
echo "verificando con curl"
curl 192.168.56.101:9999
echo "finalizando script"
exit
