#!/bin/bash -
### Auth: Jin
### Date: 2016-11-07

if [ $# -eq 1 ];then
    /usr/bin/unzip -o  $1  -d /data/www/butree.ejuops.com && /bin/cp /data/pkgs/.env  /data/www/butree.ejuops.com/
    test $? -eq 0 && printf "Update ok" || printf "Update fail"
    chmod -R 777 /data/www/butree.ejuops.com/storage/
    chmod -R 777 /data/www/butree.ejuops.com/vendor/
    chmod -R 777 /data/www/butree.ejuops.com/bootstrap/cache/
else
    printf "Give one or more than two args, Usge: $0 filename\n"
fi