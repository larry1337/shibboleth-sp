#!/bin/sh
rm -r ./si-sp/ilias-config/
mkdir ./si-sp/ilias-config/
cp -r ./si-sp/ilias-config-base/iliasdata ./si-sp/ilias-config/
#cp -r ./si-sp/ilias-config-base/clientdata ./si-sp/ilias-config/
cp ./si-sp/ilias-config-base/ilias.ini.php.base ./si-sp/ilias-config/ilias.ini.php
rm -r ./si-sp/localcerts 
rm -r ./si-sp/shibboleth-logs
rm -r ./mysql-db 
