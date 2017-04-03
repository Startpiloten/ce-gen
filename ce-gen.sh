#!/usr/bin/env bash
clear
echo
echo "##################TYPO3 t3cegenerator by analog 2017 ####################"
echo "# This Generator generates an Contentelement to your provider extension #"
echo "#########################################################################"
echo

bindir=vendor/analogde/ce-gen
libdir=vendor/analogde/ce-lib

source $bindir/bin/dir-selector.sh

extname="$(basename $extensiondir)"

ctype () {
    read -p "Enter cType you want to create: " cename
    while [[ $cename == '' ]]
    do
        echo "Enter a valid Name"
        read -p "Enter cType you want to create: " cename
    done
    cenameUpper=${cename};
    cenameUpper=`echo ${cenameUpper:0:1} | tr  '[a-z]' '[A-Z]'`${cenameUpper:1}
    if [ -f "${extensiondir}/Configuration/PageTS/ContentElements/typoscript_${cename}.t3s" ]
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
        if [ -f "${extensiondir}/Configuration/TCA/Overrides/tt_content_${cename}.php" ]
            then
                echo
                echo "This cType is already present"
                echo
                exit 1
            else
                title
                description
                echo
                source ${bindir}/bin/ts-generator.sh
                source ${bindir}/bin/tca-generator.sh
                source ${bindir}/bin/file-copy.sh
                source ${bindir}/bin/be-generator.sh
                echo
        fi
    else
        echo
        echo "No provider extension with the name $extname available";
        echo
    fi
}

run_generator () {
    if [ -d "vendor/analogde/ce-lib" ]
    then
        read -p "Do you want to import a cType from the library? [Y/N] " -n 1 -r
        echo    # (optional) move to a new line
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
            source ${bindir}/bin/ce-library-tool.sh
        else
            echo
            echo "Ok! Create simple cType now:"
            echo
            create_simple_ce
        fi
    else
        create_simple_ce
    fi
}

run_generator
