#!/usr/bin/env bash

export extname
export cename
export cenameUpper
export cetitle
export cedescription

## Backend Preview
mkdir -p $extensiondir/Resources/Private/BackendPreviews
envsubst '${extname} ${cename} ${cenameUpper} ${cetitle} ${cedescription}' < $bindir/lib/basic/BE_ctype.html > $extensiondir/Resources/Private/BackendPreviews/BE_${cenameUpper}.html
printf "Backen Template Ready" && sleep 0.2 && printf "." && sleep 0.2 && printf "." && sleep 0.2 && printf ".\n"

## Frontend Template
cp $bindir/lib/basic/FE_ctype.html $extensiondir/Resources/Private/Templates/ContentElements/FE_${cenameUpper}.html
printf "Frontent Template Ready" && sleep 0.2 && printf "." && sleep 0.2 && printf "." && sleep 0.2 && printf ".\n"

## TCA
envsubst '${extname} ${cename} ${cenameUpper} ${cetitle} ${cedescription}' < $bindir/lib/basic/tt_content_ctype.php > $extensiondir/Configuration/TCA/Overrides/tt_content_${cename}.php
printf "TCA Ready" && sleep 0.2 && printf "." && sleep 0.2 && printf "." && sleep 0.2 && printf ".\n"

## Page TS
envsubst '${extname} ${cename} ${cenameUpper} ${cetitle} ${cedescription}' < $bindir/lib/basic/pagets_ce_wizard.t3s > $extensiondir/Configuration/PageTS/ContentElements/pagets_${cename}.t3s
printf "PageTS Ready" && sleep 0.2 && printf "." && sleep 0.2 && printf "." && sleep 0.2 && printf ".\n"

## Typoscript
envsubst '${extname} ${cename} ${cenameUpper} ${cetitle} ${cedescription}' < $bindir/lib/basic/typoscript_ce_ctype.t3s > $extensiondir/Configuration/TypoScript/ContentElements/typoscript_${cename}.t3s
printf "Typoscript Ready" && sleep 0.2 && printf "." && sleep 0.2 && printf "." && sleep 0.2 && printf ".\n"
