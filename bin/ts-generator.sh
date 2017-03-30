#!/usr/bin/env bash

export extname
export cename
export cenameUpper
export cetitle
export cedescription

envsubst '${extname} ${cename} ${cenameUpper} ${cetitle} ${cedescription}' < $bindir/lib/typoscript/pagets_ce_wizard.t3s > $extensiondir/Configuration/PageTS/ContentElements/${extname}_${cename}.t3s

printf "PageTS Ready" && sleep 0.5 && printf "." && sleep 0.5 && printf "." && sleep 0.5 && printf ".\n"

envsubst '${extname} ${cename} ${cenameUpper} ${cetitle} ${cedescription}' < $bindir/lib/typoscript/typoscript_ce_ctype.t3s > $extensiondir/Configuration/TypoScript/ContentElements/ce_${cename}.t3s

printf "Typoscript Ready" && sleep 0.5 && printf "." && sleep 0.5 && printf "." && sleep 0.5 && printf ".\n"
