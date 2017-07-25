#!/bin/bash
read -r n1
read -p "$n1" name
suma=0
cont=0
for i in $name; do
    suma=$((suma + i))
    #cont=$(($cont + 1))
    #echo "acaaaaaaa $cont ---------$suma"
done
echo "Es $suma!"
