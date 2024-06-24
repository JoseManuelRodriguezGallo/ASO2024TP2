#!/bin/bash

#Generar un numero aleatorio entre 1 y 100
numero_secreto=$((RANDOM % 100 + 1))

#Funcion para verificar el intento del usuario
advinar(){
    echo "Adivina el numero (entre 1 y 100):"
    while true; do
    read intento
    if [[ $intento -lt $numero_secreto ]]; then
        echo "Demasiado bajo. intenta de nuevo:"
    elif [[ $intento -gt $numero_secreto ]]; then
        echo "Demasiado alto. intenta de nuevo:"
    else
        echo "¡Felcidades! Adivinaste el numero correcto: $numero_secreto"
    break
    fi
    done
}

#Llamar a la funcion para iniciar el juego
advinar