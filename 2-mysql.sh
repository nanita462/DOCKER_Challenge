#!/bin/bash

var1= mysql --user="root" --password="secret-pw"

echo "Ejecutanto contenedor MySQL y PHPMyAdmin"
echo "inicializando container MySQL"
docker run --name=db -p 3306:3306 -e MYSQL_ROOT_PASSWORD=secret-pw -d mysql:8
echo "inicializando container PHPMyAdmin"
docker run --name=my-admin -p 82:80 --link db:db -d phpmyadmin
echo "finalizado"

 

