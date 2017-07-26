#!/bin/bash
read -r n1
for i in $(seq -s ' ' 1 $n1)
do
    read -r n2 n3 n4
    l1=$(python -c "print($n2 ** 2)")
    l2=$(python -c "print($n3 ** 2)")
    l3=$(python -c "print($n4 ** 2)")
    if [ "$(($l1 + $l2))" -eq $l3 ]; then
        respuesta="${respuesta} R"
    elif [ "$(($l1 + $l2))" -lt $l3 ]; then
        respuesta="${respuesta} O"
    else
        respuesta="${respuesta} A"
    fi
done

echo "$respuesta"
