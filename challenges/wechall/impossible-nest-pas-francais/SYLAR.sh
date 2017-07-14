#!/bin/bash

wget -O number.txt --no-cookies --header "Cookie:WC=9708475-34593-jaw9ISkrkhUWYFNQ" \
	www.wechall.net/challenge/impossible/index.php?request=new_number


curl -o resp.txt -b "WC=9708475-34593-jaw9ISkrkhUWYFNQ" -d "solution=13" -d "cmd=Send" \
	-d "gwf3_csrf=KDMhQzUN" http://www.wechall.net/challenge/impossible/index.php


grep 'Correct would have been' resp.txt | grep -o -E '[0-9]+' >> sol.txt

SOLUTION=$(head sol.txt)

echo $SOLUTION

curl -o resp.html -b "WC=9708475-34593-jaw9ISkrkhUWYFNQ" -d "solution=$SOLUTION" -d "cmd=Send" \
		-d "gwf3_csrf=KDMhQzUN" http://www.wechall.net/challenge/impossible/index.php
