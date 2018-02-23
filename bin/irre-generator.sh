#!/usr/bin/env bash

export extname
export cename
export cenameUpper
export cetitle
export cedescription

## Backend Preview
mkdir -p $extensiondir/Resources/Private/BackendPreviews
envsubst '${extname} ${cename} ${cenameUpper} ${cetitle} ${cedescription}' < $bindir/lib/irre/BE_ctype.html > $extensiondir/Resources/Private/ContentElements/BackendPreviews/BE_${cenameUpper}.html
printf "Backend Template Ready" && sleep 0.1 && printf "." && sleep 0.1 && printf "." && sleep 0.1 && printf ".\n"

## Frontend Template
envsubst '${extname} ${cename} ${cenameUpper} ${cetitle} ${cedescription}' < $bindir/lib/irre/FE_ctype.html > $extensiondir/Resources/Private/ContentElements/Templates/FE_${cenameUpper}.html
printf "Frontent Template Ready" && sleep 0.1 && printf "." && sleep 0.1 && printf "." && sleep 0.1 && printf ".\n"

## TCA
mkdir -p $extensiondir/Configuration/TCA/Overrides
envsubst '${extname} ${cename} ${cenameUpper} ${cetitle} ${cedescription}' < $bindir/lib/irre/tt_content_ctype.php > $extensiondir/Configuration/TCA/tt_content_${cename}.php
printf "TCA Override Ready" && sleep 0.1 && printf "." && sleep 0.1 && printf "." && sleep 0.1 && printf ".\n"

envsubst '${extname} ${cename} ${cenameUpper} ${cetitle} ${cedescription}' < $bindir/lib/irre/tx_table.php > $extensiondir/Configuration/TCA/tx_${cename}.php
printf "TCA tx_${cename}.php Ready" && sleep 0.1 && printf "." && sleep 0.1 && printf "." && sleep 0.1 && printf ".\n"

## Page TS
envsubst '${extname} ${cename} ${cenameUpper} ${cetitle} ${cedescription}' < $bindir/lib/irre/pagets_ce_wizard.t3s > $extensiondir/Configuration/TSconfig/ContentElements/${cename}.tsconfig
printf "PageTS Ready" && sleep 0.1 && printf "." && sleep 0.1 && printf "." && sleep 0.1 && printf ".\n"

## Typoscript
envsubst '${extname} ${cename} ${cenameUpper} ${cetitle} ${cedescription}' < $bindir/lib/irre/typoscript_ce_ctype.t3s > $extensiondir/Configuration/TypoScript/ContentElements/${cename}.typoscript
printf "Typoscript Ready" && sleep 0.1 && printf "." && sleep 0.1 && printf "." && sleep 0.1 && printf ".\n"

##SQL
envsubst '${extname} ${cename} ${cenameUpper} ${cetitle} ${cedescription}' < $bindir/lib/irre/ext_tables_irre.sql >> $extensiondir/ext_tables.sql
printf "SQL Ready" && sleep 0.1 && printf "." && sleep 0.1 && printf "." && sleep 0.1 && printf ".\n"

##ext_tables.php
envsubst '${extname} ${cename} ${cenameUpper} ${cetitle} ${cedescription}' < $bindir/lib/irre/ext_tables.php >> $extensiondir/ext_tables.php
printf "ext_tables.php Ready" && sleep 0.1 && printf "." && sleep 0.1 && printf "." && sleep 0.1 && printf ".\n"

## SCSS
mkdir -p $extensiondir/Resources/Build/Assets/Scss/content-elements
envsubst '${extname} ${cename} ${cenameUpper} ${cetitle} ${cedescription}' < $bindir/lib/irre/_ctype.scss > $extensiondir/Resources/Build/Assets/Scss/content-elements/_ce-${cename}.scss

if ! [ -f "$extensiondir/Resources/Build/Assets/Scss/content-elements/_ce-includes.scss" ]
    then
        touch $extensiondir/Resources/Build/Assets/Scss/content-elements/_ce-includes.scss
fi
echo "@import 'ce-${cename}';" >> $extensiondir/Resources/Build/Assets/Scss/content-elements/_ce-includes.scss
printf "SCSS Ready" && sleep 0.1 && printf "." && sleep 0.1 && printf "." && sleep 0.1 && printf ".\n"