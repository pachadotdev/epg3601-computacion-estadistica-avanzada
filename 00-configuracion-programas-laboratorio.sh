#!/bin/bash

GREEN='\033[0;32m'

# actualizo el sistema
printf "\n${GREEN}--------------------\nActualizando APT\n--------------------\n"
apt-get -y update

# cmake y g++
printf "\n${GREEN}-------------------------\nInstalando CMAKE y G++\n-------------------------\n"
apt-get -y install cmake build-essential

# verifico la version del compilador de g++
g++ --version

# julia
printf "\n${GREEN}-------------------------\nInstalando JULIA\n-------------------------\n"
apt-get -y install julia

# verifico la version de julia
julia --version

# julia
printf "\n${GREEN}-------------------------\nInstalando VSCODE\n-------------------------\n"
cd ~ && wget --no-check-certificate https://az764295.vo.msecnd.net/stable/2b9aebd5354a3629c3aba0a5f5df49f43d6689f8/code_1.54.3-1615806378_amd64.deb
apt-get -y install gdebi-core
gdebi --n code_1.54.3-1615806378_amd64.deb && rm code_1.54.3-1615806378_amd64.deb

# creo un archivo C de prueba
printf "\n${GREEN}-------------------------\nProbando el compilador de C\n-------------------------\n"
cd ~

printf '// prueba.c

#include <stdio.h>

int main() {
    printf("\\nSi lees esto quiere decir que el archivo compila bien\\n");
    return 0;
}' | tee prueba.c

# compilo el archivo de prueba
gcc prueba.c -o prueba

# ejecuto el archivo de prueba
./prueba

rm prueba.c prueba

