#!/usr/bin/env bash
clear
echo
echo "##################TYPO3 t3cegenerator by analog 2017 ####################"
echo "# This Generator generates an Contentelement to your provider extension #"
echo "#########################################################################"
echo

bindir=vendor/analogde/ce-gen

source $bindir/bin/dir-selector.sh

extname="$(basename $extensiondir)"

ctype () {
    read -p "Enter cType you want to create: " cename
    while [[ $cename == '' ]]
    do
        read -p "Enter CE Name: " cename
        echo "Enter a valid Name"
    done
    cenameUpper=${cename};
    cenameUpper=`echo ${cenameUpper:0:1} | tr  '[a-z]' '[A-Z]'`${cenameUpper:1}
    if [ -f "${extensiondir}/Configuration/PageTS/ContentElements/${extname}_${cename}.t3s" ]
    then
        echo "Content Element exists"
        exit 1
    fi
}

title () {
    read -p "Content Element Title: " cetitle
    while [[ ${cetitle} == '' ]]
    do
        read -p "Content Element Title: " cetitle
        echo "Enter a valid Content Element Title"
    done
}

description () {
    read -p "Content Element Description: " cedescription
    while [[ ${cedescription} == '' ]]
    do
        read -p "Content Element Description: " cedescription
        echo "Enter a valid Content Element Description"
    done
}

create_simple_ce () {
    if [ -d "web/typo3conf/ext/$extname" ]
    then
        ctype
        title
        description
        echo
        source ${bindir}/bin/ts-generator.sh
        source ${bindir}/bin/tca-generator.sh
        source ${bindir}/bin/file-copy.sh
        source ${bindir}/bin/be-generator.sh
        echo
    else
        echo
        echo "No provider extension with the name $extname available";
        echo
    fi
}

select_ctype_from_lib () {
    ctypeselection=$(for d in vendor/bo/ce-lib/cTypes/* ; do printf "$(basename $d) " ; done)
    select libcType in $ctypeselection ; do echo "$libcType" && break; echo ">>> Invalid Selection"; done
}

if [ -d "vendor/bo/ce-lib" ]
then
    read -p "Do you want to import a cType from the library? [Y/y] " -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        select_ctype_from_lib
    else
        echo
        echo "Ok! Create simple cType now:"
        echo
        create_simple_ce
    fi
else
    echo "no"
fi
