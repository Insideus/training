#!/bin/bash
wget -O ocr.png --no-cookies --header "Cookie:WC=" \
    http://www.wechall.net/challenge/can_you_readme/gimme.php

tesseract ocr.png ocr -psm 7

SOLUTION=`head -1 ocr.txt`

curl -b "WC=" -G -d "solution=$SOLUTION" -d "cmd=Answer" \
    http://www.wechall.net/challenge/can_you_readme/index.php
