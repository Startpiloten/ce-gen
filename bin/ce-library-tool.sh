#!/usr/bin/env bash

select_ctype_from_lib () {
    ctypeselection=$(for d in vendor/analogde/ce-lib/cTypes/* ; do printf "$(basename $d) " ; done)
    select libcType in $ctypeselection ; do echo "Get cType >> $libcType << now" && break; echo ">>> Invalid Selection"; done
}

select_ctype_from_lib

echo ${extname}