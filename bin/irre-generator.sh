#!/usr/bin/env bash

export extname
export cename
export cenameUpper
export cetitle
export cedescription

## Backend Preview
mkdir -p $extensiondir/Resources/Private/BackendPreviews
envsubst '${extname} ${cename} ${cenameUpper} ${cetitle} ${cedescription}' < $bindir/lib/irre/BE_ctype.html > $extensiondir/Resources/Private/BackendPreviews/BE_${cenameUpper}.html
printf "Backen Template Ready" && sleep 0.2 && printf "." && sleep 0.2 && printf "." && sleep 0.2 && printf ".\n"

## Frontend Template
envsubst '${extname} ${cename} ${cenameUpper} ${cetitle} ${cedescription}' < $bindir/lib/irre/FE_ctype.html > $extensiondir/Resources/Private/Templates/ContentElements/FE_${cenameUpper}.html
printf "Frontent Template Ready" && sleep 0.2 && printf "." && sleep 0.2 && printf "." && sleep 0.2 && printf ".\n"

## TCA
envsubst '${extname} ${cename} ${cenameUpper} ${cetitle} ${cedescription}' < $bindir/lib/irre/tt_content_ctype.php > $extensiondir/Configuration/TCA/Overrides/tt_content_${cename}.php
printf "TCA Override Ready" && sleep 0.2 && printf "." && sleep 0.2 && printf "." && sleep 0.2 && printf ".\n"

envsubst '${extname} ${cename} ${cenameUpper} ${cetitle} ${cedescription}' < $bindir/lib/irre/tx_table.php > $extensiondir/Configuration/TCA/tx_${cename}.php
printf "TCA tx_${cename}.php Ready" && sleep 0.2 && printf "." && sleep 0.2 && printf "." && sleep 0.2 && printf ".\n"

## Page TS
envsubst '${extname} ${cename} ${cenameUpper} ${cetitle} ${cedescription}' < $bindir/lib/irre/pagets_ce_wizard.t3s > $extensiondir/Configuration/PageTS/ContentElements/pagets_${cename}.t3s
printf "PageTS Ready" && sleep 0.2 && printf "." && sleep 0.2 && printf "." && sleep 0.2 && printf ".\n"

## Typoscript
envsubst '${extname} ${cename} ${cenameUpper} ${cetitle} ${cedescription}' < $bindir/lib/irre/typoscript_ce_ctype.t3s > $extensiondir/Configuration/TypoScript/ContentElements/typoscript_${cename}.t3s
printf "Typoscript Ready" && sleep 0.2 && printf "." && sleep 0.2 && printf "." && sleep 0.2 && printf ".\n"

##SQL
envsubst '${extname} ${cename} ${cenameUpper} ${cetitle} ${cedescription}' < $bindir/lib/irre/ext_tables_irre.sql >> $extensiondir/ext_tables.sql
printf "SQL Ready" && sleep 0.2 && printf "." && sleep 0.2 && printf "." && sleep 0.2 && printf ".\n"

##ext_tables.php
envsubst '${extname} ${cename} ${cenameUpper} ${cetitle} ${cedescription}' < $bindir/lib/irre/ext_tables.php >> $extensiondir/ext_tables.php
printf "ext_tables.php Ready" && sleep 0.2 && printf "." && sleep 0.2 && printf "." && sleep 0.2 && printf ".\n"

## SCSS
mkdir -p $extensiondir/Resources/Public/Css/scss_includes/content-elements
cp $bindir/lib/basic/_ctype.scss $extensiondir/Resources/Public/Css/scss_includes/content-elements/_${cename}.scss
if ! [ -f "$extensiondir/Resources/Public/Css/scss_includes/_content-elements.scss" ]
    then
        touch $extensiondir/Resources/Public/Css/scss_includes/_content-elements.scss
fi
echo "@import 'content-elements/_${cename}.scss';" >> $extensiondir/Resources/Public/Css/scss_includes/_content-elements.scss
printf "SCSS Ready" && sleep 0.1 && printf "." && sleep 0.1 && printf "." && sleep 0.1 && printf ".\n"