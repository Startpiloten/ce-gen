#!/usr/bin/env bash

export extname
export cename
export cenameUpper
export cetitle
export cedescription

## Backend Preview
mkdir -p $extensiondir/Resources/Private/BackendPreviews
envsubst '${extname} ${cename} ${cenameUpper} ${cetitle} ${cedescription}' < $bindir/lib/basic/BE_ctype.html > $extensiondir/Resources/Private/BackendPreviews/BE_${cenameUpper}.html
printf "Backend Template Ready" && sleep 0.1 && printf "." && sleep 0.1 && printf "." && sleep 0.1 && printf ".\n"

## Frontend Template
cp $bindir/lib/basic/FE_ctype.html $extensiondir/Resources/Private/Templates/ContentElements/FE_${cenameUpper}.html
printf "Frontent Template Ready" && sleep 0.1 && printf "." && sleep 0.1 && printf "." && sleep 0.1 && printf ".\n"

## TCA
envsubst '${extname} ${cename} ${cenameUpper} ${cetitle} ${cedescription}' < $bindir/lib/basic/tt_content_ctype.php > $extensiondir/Configuration/TCA/tt_content_${cename}.php
printf "TCA Ready" && sleep 0.1 && printf "." && sleep 0.1 && printf "." && sleep 0.1 && printf ".\n"

## Page TS
mkdir -p $extensiondir/Configuration/PageTS/ContentElements
envsubst '${extname} ${cename} ${cenameUpper} ${cetitle} ${cedescription}' < $bindir/lib/basic/pagets_ce_wizard.t3s > $extensiondir/Configuration/PageTS/ContentElements/pagets_${cename}.t3s
printf "PageTS Ready" && sleep 0.1 && printf "." && sleep 0.1 && printf "." && sleep 0.1 && printf ".\n"

## Typoscript
mkdir -p $extensiondir/Configuration/TypoScript/ContentElements
envsubst '${extname} ${cename} ${cenameUpper} ${cetitle} ${cedescription}' < $bindir/lib/basic/typoscript_ce_ctype.t3s > $extensiondir/Configuration/TypoScript/ContentElements/typoscript_${cename}.t3s
printf "Typoscript Ready" && sleep 0.1 && printf "." && sleep 0.1 && printf "." && sleep 0.1 && printf ".\n"

## SCSS
mkdir -p $extensiondir/Resources/Public/Css/scss_includes/content-elements
cp $bindir/lib/basic/_ctype.scss $extensiondir/Resources/Public/Css/scss_includes/content-elements/_${cename}.scss
if ! [ -f "$extensiondir/Resources/Public/Css/scss_includes/_content-elements.scss" ]
    then
        touch $extensiondir/Resources/Public/Css/scss_includes/_content-elements.scss
fi
echo "@import 'content-elements/_${cename}.scss';" >> $extensiondir/Resources/Public/Css/scss_includes/_content-elements.scss
printf "SCSS Ready" && sleep 0.1 && printf "." && sleep 0.1 && printf "." && sleep 0.1 && printf ".\n"
