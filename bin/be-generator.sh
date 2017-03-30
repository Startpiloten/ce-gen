#!/usr/bin/env bash

export extname
export cename
export cenameUpper
export cetitle
export cedescription

mkdir -p $extensiondir/Resources/Private/BackendPreviews

envsubst '${extname} ${cename} ${cenameUpper} ${cetitle} ${cedescription}' < $bindir/lib/Templates/BE_ctype.html > $extensiondir/Resources/Private/BackendPreviews/BE_${cenameUpper}.html

printf "Backen Template Ready" && sleep 0.5 && printf "." && sleep 0.5 && printf "." && sleep 0.5 && printf ".\n"
