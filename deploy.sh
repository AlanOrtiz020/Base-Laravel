#!/bin/bash
# Definir variable con la ruta del proyecto
PROJECT_PATH=$(pwd)/src

# Cargar variables de entorno del archivo .env
source $(pwd)/.env

# Verificar si la carpeta src existe
if [ ! -d "$PROJECT_PATH" ]
then
  # Si no existe, crearla
  mkdir $PROJECT_PATH
fi

# Clonar repositorio en SRC
cd $PROJECT_PATH
git clone $GIT_REPOSITORY .

# Levantar Proyecto con docker-compose 
cd ..
docker-compose up -d
