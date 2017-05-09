#!/usr/bin/env bash

select_ctype_from_lib () {
    ctypeselection=$(for d in vendor/analogde/ce-lib/cTypes/* ; do printf "$(basename $d) " ; done)
    select libcType in $ctypeselection ; do echo "Get cType >> $libcType << now" && break; echo ">>> Invalid Selection"; done
}

generate_ce_files () {

# Templates
cp ${libdir}/cTypes/${libcType}/FE_${libcTypeUpper}.html ${extensiondir}/Resources/Private/Templates/ContentElements/FE_${libcTypeUpper}.html
cp ${libdir}/cTypes/${libcType}/BE_${libcTypeUpper}.html ${extensiondir}/Resources/Private/BackendPreviews/BE_${libcTypeUpper}.html

# Typoscript
cp ${libdir}/cTypes/${libcType}/pagets_${libcType}.t3s ${extensiondir}/Configuration/PageTS/ContentElements/pagets_${libcType}.t3s
sed -i '' "s/provider/${extname}/g" ${extensiondir}/Configuration/PageTS/ContentElements/pagets_${libcType}.t3s

cp ${libdir}/cTypes/${libcType}/typoscript_${libcType}.t3s ${extensiondir}/Configuration/TypoScript/ContentElements/typoscript_${libcType}.t3s
sed -i '' "s/provider/${extname}/g" ${extensiondir}/Configuration/TypoScript/ContentElements/typoscript_${libcType}.t3s

# TCA
cp ${libdir}/cTypes/${libcType}/tt_content_${libcType}.php ${extensiondir}/Configuration/TCA/Overrides/tt_content_${libcType}.php
sed -i '' "s/provider/${extname}/g" ${extensiondir}/Configuration/TCA/Overrides/tt_content_${libcType}.php

if [ -f ${libdir}/cTypes/${libcType}/ext_tables.sql ]
    then
        cat ${libdir}/cTypes/${libcType}/ext_tables.sql | sed "s/provider/${extname}/g" >> ${extensiondir}/ext_tables.sql
fi

echo
echo "Your new Content Element is ready!"
echo

}

select_ctype_from_lib

libcTypeUpper=${libcType};
libcTypeUpper=`echo ${libcTypeUpper:0:1} | tr  '[a-z]' '[A-Z]'`${libcTypeUpper:1}

if [ -f "${extensiondir}/Configuration/TCA/Overrides/tt_content_${libcType}.php" ]
then
    echo
    echo "This cType is already present"
    echo
    exit 1
else
    generate_ce_files
fi
