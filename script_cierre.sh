#!/bin/bash

echo "iniciando cierre de contenedores"
docker ps
echo "deteniendo contenedores"
docker stop $(docker ps)
echo "verificando estado"
docker ps -a 
echo "borrando todos los contenedores"
docker rm $(docker ps -a) 
docker ps -a
echo "script finalizado"
