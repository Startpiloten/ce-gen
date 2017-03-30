#!/usr/bin/env bash
clear
echo
echo "##################TYPO3 t3cegenerator by analog 2017 ####################"
echo "# This Generator generates an Contentelement to your provider extension #"
echo "#########################################################################"
echo

bindir=vendor/bo/ce-gen

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
