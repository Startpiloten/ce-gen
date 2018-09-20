#!/usr/bin/env bash
clear

#parse_yaml function
parse_yaml() {
   local prefix=$2
   local s='[[:space:]]*' w='[a-zA-Z0-9_]*' fs=$(echo @|tr @ '\034')
   sed -ne "s|^\($s\)\($w\)$s:$s\"\(.*\)\"$s\$|\1$fs\2$fs\3|p" \
        -e "s|^\($s\)\($w\)$s:$s\(.*\)$s\$|\1$fs\2$fs\3|p"  $1 |
   awk -F$fs '{
      indent = length($1)/2;
      vname[indent] = $2;
      for (i in vname) {if (i > indent) {delete vname[i]}}
      if (length($3) > 0) {
         vn=""; for (i=0; i<indent; i++) {vn=(vn)(vname[i])("_")}
         printf("%s%s%s=\"%s\"\n", "'$prefix'",vn, $2, $3);
      }
   }'
}

# Check YAML files
if [ ! -f .t3.cegen.yaml ]; then
    echo ".t3.cegen.yaml not found!"
    cp vendor/analogde/ce-gen/lib/.t3.cegen.yaml .t3.cegen.yaml
    exit
fi

# Read yaml file
load_yaml() {
    eval $(parse_yaml .t3.cegen.yaml)
}

load_yaml

echo "Extension Name" $extension_name


COLUMNS=12

if [ -f ~/.profile ]
    then
    source ~/.profile
fi

continue=true
bindir=vendor/analogde/ce-gen
libdir=vendor/analogde/ce-lib

extname=$extension_name
extensiondir=$extension_path

ctype () {
    read -p "Enter cType you want to create: " cename
    while [[ $cename == '' ]]
    do
        echo "Enter a valid Name"
        read -p "Enter cType you want to create: " cename
    done
    cename=$(echo "$cename" | sed 's/ //g' | sed 's/[^a-zA-Z0-9]//g' | tr '[:upper:]' '[:lower:]')
    cenameUpper=${cename};
    cenameUpper=`echo ${cenameUpper:0:1} | tr  '[a-z]' '[A-Z]'`${cenameUpper:1}
    if [ -f "${extensiondir}/Configuration/TCA/tt_content_${cename}.php" ]
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

mmtitle () {
    read -p "Enter a Title for the MM Item: " mmtitle
    while [[ ${mmtitle} == '' ]]
    do
        read -p "Enter a Title for the MM Item: " mmtitle
        echo "Enter a valid Title for the MM Item (singular)"
    done
    mmtitleLower=$(echo "$mmtitle" | sed 's/ //g' | sed 's/[^a-zA-Z0-9]//g' | tr '[:upper:]' '[:lower:]')
}

create_simple_ce () {
    ctype
    if [ -f "${extensiondir}/Configuration/TCA/tt_content_${cename}.php" ]
        then
            echo
            echo "This cType is already present"
            echo
            exit 1
        else
            title
            description
            echo
            source ${bindir}/bin/basic-generator.sh
            echo
    fi
}

create_irre_ce () {
    ctype
    if [ -f "${extensiondir}/Configuration/TCA/tt_content_${cename}.php" ]
        then
            echo
            echo "This cType is already present"
            echo
            exit 1
        else
            title
            description
            echo
            source ${bindir}/bin/irre-generator.sh
            echo
    fi
}

create_mm_ce () {
    mmtitle
    ctype
    if [ -f "${extensiondir}/Configuration/TCA/tt_content_${cename}.php" ]
        then
            echo
            echo "This cType is already present"
            echo
            exit 1
        else
            title
            description
            echo
            source ${bindir}/bin/mm-generator.sh
            echo
    fi
}

choose_type_to_generate () {
    PS3='What type of element do you want to generate: '
    options=("Default Item" "Irre Item" "MM Item")
    select opt in "${options[@]}"
    do
        case $opt in
            "Default Item")
                echo
                create_simple_ce
                echo
                break
                ;;
            "Irre Item")
                echo
                create_irre_ce
                echo
                break
                ;;
            "MM Item")
                echo
                create_mm_ce
                echo
                break
                ;;
            *) echo invalid option;;
        esac
    done
}

clear_cache() {
if [ -f typo3cms ]
    then
        echo "Clear Cache and Update Schema"
        php typo3cms database:updateschema "*"
        php typo3cms cache:flush --force
fi
if [ -f typo3cms ]
    then
        echo "Clear Cache and Update Schema"
        php typo3cms database:updateschema "*"
        php typo3cms cache:flush --force
fi
}

run_generator () {
    if [ -d "vendor/analogde/ce-lib" ]
    then
        read -p "Do you want to import a cType from the library? [Y/N] " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
            source ${bindir}/bin/ce-library-tool.sh
        else
            echo
            echo "Ok! Create custom cType now:"
            choose_type_to_generate
        fi
    else
        choose_type_to_generate
    fi
}

restart () {
    echo
    echo
    read -p "Do you want to restart? [Y/N] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        continue=true
        echo
    else
        continue=false
        echo
        echo "Bye!"
    fi
}

info () {
    echo
    printf '\033[0;31m'
    echo "For older version add this to your TS"
    echo "lib.ce_${extname} < lib.default"
    printf '\033[0m'
}

prepare () {
    mkdir -p $extensiondir/Configuration/TSconfig/ContentElements
    mkdir -p $extensiondir/Resources/Private/ContentElements/Templates
    mkdir -p $extensiondir/Configuration/TCA
    mkdir -p $extensiondir/Configuration/TSconfig/ContentElements
    mkdir -p $extensiondir/Resources/Build/Assets/Scss/content-elements
    mkdir -p $extensiondir/Resources/Private/ContentElements/BackendPreviews
}

while [ $continue == "true" ]
do
    prepare
    run_generator
    clear_cache
    info
    restart
done