#!/usr/bin/env bash

export extname
export cename
export cenameUpper
export cetitle
export cedescription

envsubst '${extname} ${cename} ${cenameUpper} ${cetitle} ${cedescription}' < $bindir/lib/TCA/tt_content_ctype.php > $extensiondir/Configuration/TCA/Overrides/tt_content_${cename}.php

printf "TCA Ready" && sleep 0.5 && printf "." && sleep 0.5 && printf "." && sleep 0.5 && printf ".\n"
