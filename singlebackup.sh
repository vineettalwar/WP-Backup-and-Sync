#!/usr/bin/env bash
# Read Documentation before proceeding
cd /var/www/html/example.com;
/usr/local/bin/wp db export ;
/usr/bin/zip -R "example-$(date +"%d-%m-%Y").zip" '*.sql';
mkdir -p "../backups/db/$(date +"%Y-%m")/" ;
mv '*zip' "../backups/db/$(date +"%Y-%m")/" ;
rm '*.sql' ;
