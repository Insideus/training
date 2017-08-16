#!/bin/bash

wget -O number.txt --no-cookies --header "Cookie:WC=9708475-34593-jaw9ISkrkhUWYFNQ" \


grep 'Correct would have been' resp.txt | grep -o -E '[0-9]+' >> sol.txt

SOLUTION=$(head sol.txt)

curl -o resp.html -b "WC=9708475-34593-jaw9ISkrkhUWYFNQ" -d "solution=$SOLUTION" -d "cmd=Send" \
        -d "gwf3_csrf=KDMhQzUN" http://www.wechall.net/challenge/impossible/index.php

echo $SOLUTION

curl -o resp.html -b "WC=9708475-34593-jaw9ISkrkhUWYFNQ" -d "solution=$SOLUTION" -d "cmd=Send" \
		-d "gwf3_csrf=KDMhQzUN" http://www.wechall.net/challenge/impossible/index.php

