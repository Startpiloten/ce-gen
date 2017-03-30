#!/bin/sh

printf "Please select your extension:\n\n"
select extensiondir in web/typo3conf/ext/* ; do test -n "$extensiondir" && break; echo ">>> Invalid Selection"; done

export extensiondir