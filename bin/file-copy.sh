#!/usr/bin/env bash

cp $bindir/lib/Templates/FE_ctype.html $extensiondir/Resources/Private/Templates/ContentElements/FE_${cenameUpper}.html

printf "Frontent Template Ready" && sleep 0.5 && printf "." && sleep 0.5 && printf "." && sleep 0.5 && printf ".\n"
