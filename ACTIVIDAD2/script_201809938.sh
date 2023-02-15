#!/usr/bin/env bash
set -o errexit
set -o pipefail
set -o nounset

# ACTIVIDAD 2 - JORGE CASTAÑEDA - 201809938

# OBTENER USUARIO DE GIT
user=$(echo $GITHUB_USER)
# echo $?

# TRAERSE EL CONTENIDO DE LA API
content=$(curl https://api.github.com/users/"$user")
# echo $?

# OBTENER EL ID DE LA API
id=$(echo "$content" | jq '.id')
# echo $?

# OBTENER FECHA DE CREACION DE LA API
creacion=$(echo "$content" | jq '.created_at')
# echo $?

# OBTENER FECHA DEL SISTEMA
fecha=$(date +%F)
# echo $?

# CREAR EL DIRECTORIO
if [ -d /tmp/"$fecha" ]
then
    echo "El Directorio Ya Existe"
else
    echo "Creado El Directorio..."
    mkdir /tmp/"$fecha"
    # echo $?
fi

# CONSTRUIR MENSAJE Y GUARDAR EN VARIABLE, LUEGO VOLCAR EN EL ARCHIVO
echo "Hola $user. User ID: $id. Cuenta Creada El: $creacion" >> /tmp/"$fecha"/saludos.log

# IMPRIMIR MENSAJE DE NUEVO PARA SABER SI SE GUARDO CORRECTAMENTE
cat /tmp/"$fecha"/saludos.log
# echo $?



