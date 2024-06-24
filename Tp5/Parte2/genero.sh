#!/bin/bash

echo "Ingrese nombre de cualquier genero."
#Guardar nombre
read nombre

#API
respuesta=$(curl -s "https://api.genderize.io/?name=${nombre}")

#Imprime la respuesta completa para depuracion
echo "Respuesta de la API: $respuesta"

genero=$(echo $respuesta | jq -r '.gender')

#Imprime el valor de 'genero' para depuracion
echo "Valor de genero extraido: $genero"

if [ "$genero" == "male" ]; 
then
    #POr si es Masculino
    echo "El genero problable de $nombre es hombre."
elif [ "$genero" == "female" ]; 
then
    #Por si es Femenino
    echo "El genero problable de $nombre es mujer."
else
    #Por si es nulo
    echo "No se pudo determinar el genero de $nombre."  
fi
