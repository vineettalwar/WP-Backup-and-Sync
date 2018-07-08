#!/usr/bin/env bash
# Read Documentation before proceeding
for dir in /var/www/html/*;
do cd "$dir" &&
	/usr/local/bin/wp db export ;
	mkdir -p "../backups/db/$(date +"%Y-%m")/" ;
	/usr/bin/zip -R "$dir-$(date +"%d-%m-%Y").zip"  '*.sql' ;
	mv "$dir-$(date +"%d-%m-%Y").zip" "../backups/db/$(date +"%Y-%m")/" ;
	rm '*.sql';
done
