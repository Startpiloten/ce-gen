#!/usr/bin/env bash

export extname
export cename
export cenameUpper
export cetitle
export cedescription

## Backend Preview
mkdir -p $extensiondir/Resources/Private/BackendPreviews
envsubst '${extname} ${cename} ${cenameUpper} ${cetitle} ${cedescription}' < $bindir/lib/basic/BE_ctype.html > $extensiondir/Resources/Private/ContentElements/BackendPreviews/BE_${cenameUpper}.html
printf "Backend Template Ready" && sleep 0.1 && printf "." && sleep 0.1 && printf "." && sleep 0.1 && printf ".\n"

## Frontend Template
cp $bindir/lib/basic/FE_ctype.html $extensiondir/Resources/Private/ContentElements/Templates/FE_${cenameUpper}.html
printf "Frontent Template Ready" && sleep 0.1 && printf "." && sleep 0.1 && printf "." && sleep 0.1 && printf ".\n"

## TCA
mkdir -p $extensiondir/Configuration/TCA/Overrides
envsubst '${extname} ${cename} ${cenameUpper} ${cetitle} ${cedescription}' < $bindir/lib/basic/tt_content_ctype.php > $extensiondir/Configuration/TCA/Overrides/tt_content_${cename}.php
printf "TCA Ready" && sleep 0.1 && printf "." && sleep 0.1 && printf "." && sleep 0.1 && printf ".\n"

## Page TS
mkdir -p $extensiondir/Configuration/TSconfig/ContentElements
envsubst '${extname} ${cename} ${cenameUpper} ${cetitle} ${cedescription}' < $bindir/lib/basic/pagets_ce_wizard.t3s > $extensiondir/Configuration/TSconfig/ContentElements/${cename}.typoscript
printf "PageTS Ready" && sleep 0.1 && printf "." && sleep 0.1 && printf "." && sleep 0.1 && printf ".\n"

## Typoscript
mkdir -p $extensiondir/Configuration/TypoScript/ContentElements
envsubst '${extname} ${cename} ${cenameUpper} ${cetitle} ${cedescription}' < $bindir/lib/basic/typoscript_ce_ctype.t3s > $extensiondir/Configuration/TypoScript/ContentElements/${cename}.typoscript
printf "Typoscript Ready" && sleep 0.1 && printf "." && sleep 0.1 && printf "." && sleep 0.1 && printf ".\n"

## SCSS
mkdir -p $extensiondir/Resources/Build/Assets/Scss/content-elements
cp $bindir/lib/basic/_ctype.scss $extensiondir/Resources/Build/Assets/Scss/content-elements/_ce-${cename}.scss
if ! [ -f "$extensiondir/Resources/Build/Assets/Scss/content-elements/_ce-includes.scss" ]
    then
        touch $extensiondir/Resources/Build/Assets/Scss/content-elements/_ce-includes.scss
fi
echo "@import 'ce-${cename}';" >> $extensiondir/Resources/Build/Assets/Scss/content-elements/_ce-includes.scss
printf "SCSS Ready" && sleep 0.1 && printf "." && sleep 0.1 && printf "." && sleep 0.1 && printf ".\n"
